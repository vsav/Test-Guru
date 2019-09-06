class User < ApplicationRecord
  has_many :tests_by, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests

  scope :tests_by_level, ->(level) { where(level: level) }

  validates :username, presence: true
  validates :email, presence: true

  def show_tests(level)
    tests.tests_by_level(level)
  end
end
