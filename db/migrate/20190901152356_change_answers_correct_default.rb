# frozen_string_literal: true

class ChangeAnswersCorrectDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:answers, :correct, from: nil, to: false)
  end
end
