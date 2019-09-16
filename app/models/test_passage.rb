class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  SUCCESS = 85.0

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def test_result
    (correct_questions.to_f / test.questions.count * 100).round(1)
  end

  def test_passed?
    test_result >= SUCCESS
  end

  def current_question_id
    test.questions.order(:id).pluck(:id).index(current_question.id) + 1
  end

  def test_questions_count
    test.questions.count
  end

  private

  def before_validation_set_first_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.where(correct: true)
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
