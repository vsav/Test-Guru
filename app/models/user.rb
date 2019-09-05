class User < ApplicationRecord
  has_many :tests_by, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests

  def show_tests(level)
    Test.joins(:user_tests).where('user_id = ? AND level = ?', id, level)
  end
end
