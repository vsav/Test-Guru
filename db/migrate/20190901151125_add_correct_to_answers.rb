# frozen_string_literal: true

class AddCorrectToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column(:answers, :correct, :boolean)
  end
end
