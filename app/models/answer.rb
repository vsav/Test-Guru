# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_limit, on: :create

  scope :correct_answer, -> { where(correct: true) }

  private

  def answers_limit
    errors.add(:limit, 'question must have 1 to 4 answers') if question.answers.count >= 4
  end
end
