# frozen_string_literal: true

class AddUsersEmailNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :email, false)
  end
end
