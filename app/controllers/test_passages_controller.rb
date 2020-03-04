# frozen_string_literal: true

class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    @test_passage.abort_test if @test_passage.time_is_up?
    if @test_passage.completed?
      award_user(@test_passage)
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render 'show'
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    @gist = Gist.new(question: @test_passage.current_question,
                     user: @test_passage.user, url: result[:html_url])

    if @gist.save!
      flash[:notice] = t('.success', url: (helpers.link_to t('.view_gist'), @gist.url,
                                                           target: '_blank'))
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  private

  def award_user(test_passage)
    award = BadgeAwardService.new(test_passage).call
    current_user.badges.push(award)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
