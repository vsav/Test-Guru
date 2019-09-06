class User < ApplicationRecord
  has_many :tests_by, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :user_tests, dependent: :destroy
  has_many :tests, through: :user_tests

  def show_tests(level)
    tests.where('level = ?', level)
  end
end
