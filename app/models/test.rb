class Test < ApplicationRecord
  def self.tests_by_category(category)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.title = ?', category.capitalize)
      .order(id: :desc).pluck(:title)
  end
end

