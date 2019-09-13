class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_path(@question.test_id)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test_id)
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test_id)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render html: "Error: question with id: #{params[:id]} not found"
  end

end
