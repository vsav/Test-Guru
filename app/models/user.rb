# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  EMAIL_FORMAT = /\A[^@\s]+@[^@\s]+\z/.freeze

  has_many :tests_by, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  scope :tests_by_level, ->(level) { where(level: level) }

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :confirmable

  def show_tests(level)
    tests.tests_by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    type == 'Admin'
  end
end
