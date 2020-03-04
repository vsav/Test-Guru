# frozen_string_literal: true

class AddDefaultToTestsTimer < ActiveRecord::Migration[6.0]
  def up
    change_column_default :tests, :timer, from: nil, to: 0
  end

  def down
    change_column_default :tests, :timer, from: 0, to: nil
  end
end
