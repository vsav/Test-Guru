# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS = 85.0

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_many :badges

  before_save :before_save_set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def test_result
    (correct_questions.to_f / test_questions_count * 100).round(1)
  end

  def test_passed?
    test_result >= SUCCESS
  end

  def current_question_number
    test.questions.order(:id).pluck(:id).index(current_question.id) + 1
  end

  def test_questions_count
    test.questions.count
  end

  def progress
    (current_question_number.to_f / test_questions_count * 100).round(1)
  end

  def time_left
    (time_limit - Time.current).to_i if time_limit
  end

  def abort_test
    self.current_question = nil
  end

  def time_is_up?
    time_left&.zero?
  end

  # def time_to_pass
  #  test.timer * 60 - time_left
  # end

  private

  def time_limit
    created_at + test.timer * 60 if test.timer.positive?
  end

  def before_save_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.where(correct: true)
  end

  def next_question
    if new_record?
      self.current_question = test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
