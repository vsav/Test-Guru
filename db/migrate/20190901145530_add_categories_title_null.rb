# frozen_string_literal: true

class AddCategoriesTitleNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:categories, :title, false)
  end
end
