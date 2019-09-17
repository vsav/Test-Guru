class User < ApplicationRecord
  has_many :tests_by, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :username, presence: true
  validates :email, presence: true

  scope :tests_by_level, ->(level) { where(level: level) }

  def show_tests(level)
    tests.tests_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
