require 'digest/sha1'

class User < ApplicationRecord

  EMAIL_FORMAT = /\A[^@\s]+@[^@\s]+\z/.freeze

  #include Auth

  has_many :tests_by, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false, message: '%{value} is already taken' }, on: :create
  validates_format_of :email, with: EMAIL_FORMAT, on: :create

  scope :tests_by_level, ->(level) { where(level: level) }

  def show_tests(level)
    tests.tests_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
