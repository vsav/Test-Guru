class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category,
        lambda { |category|
          joins(:category)
            .where('categories.title = ?', category)
        }
  scope :by_level,
        lambda { |level|
          where('level = ?', level)
        }

  def self.tests_by_category(category)
    by_category(category).order(id: :desc).pluck(:title)
  end

  def self.tests_by_level(level)
    by_level(level).pluck(:level)
  end
end
