class User < ApplicationRecord
  has_many :tests_by, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests

  validates :username, presence: true
  validates :email, presence: true

  scope :tests_by_level, ->(level) { where(level: level) }

  def show_tests(level)
    tests.tests_by_level(level)
  end
end
