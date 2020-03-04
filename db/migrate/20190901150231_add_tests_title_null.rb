# frozen_string_literal: true

class AddTestsTitleNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :title, false)
  end
end
