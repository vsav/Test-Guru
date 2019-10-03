class GuruLetter
  include ActiveModel::Model

  EMAIL_FORMAT = /\A[^@\s]+@[^@\s]+\z/.freeze

  attr_accessor :name, :email, :message

  validates :name, :message, presence: true
  validates :email, format: EMAIL_FORMAT
end
