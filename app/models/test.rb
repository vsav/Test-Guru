class Test < ApplicationRecord
  belongs_to :category
  def self.tests_by_category(category)
    joins(:category).where(categories: { title: category.capitalize }).order(id: :desc).pluck(:title)
  end
end

