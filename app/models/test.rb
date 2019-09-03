class Test < ApplicationRecord
  def self.tests_by_category(category)
    where(category_id: Category.where('title = ?', category)).order(id: :desc).pluck(:title)
  end
end

