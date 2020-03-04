# frozen_string_literal: true

class AddQuestionsBodyNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:questions, :body, false)
  end
end
