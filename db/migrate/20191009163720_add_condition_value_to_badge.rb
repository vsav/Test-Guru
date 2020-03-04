# frozen_string_literal: true

class AddConditionValueToBadge < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :condition_value, :string
  end
end
