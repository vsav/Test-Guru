# frozen_string_literal: true

class ChangeTestsLevelDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:tests, :level, from: nil, to: 0)
  end
end
