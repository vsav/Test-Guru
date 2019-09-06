class Answer < ApplicationRecord
  belongs_to :question
  scope :correct_answer, -> { where(correct: true) }

  validates :body, presence: true
  validate :answers_limit, on: :create

  private

  def answers_limit
    errors.add(:limit, 'question must have 1 to 4 answers') if question.answers.count > 4
  end

end
