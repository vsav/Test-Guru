# frozen_string_literal: true

class ChangeBadgesNullState < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:badges, :img_url, false)
    change_column_null(:badges, :condition, false)
    change_column_null(:badges, :description, false)
  end
end
