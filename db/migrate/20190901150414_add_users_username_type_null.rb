class AddUsersUsernameTypeNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :username, false)
    change_column_null(:users, :admin, false)
    change_column_default(:users, :admin, from: true, to: false)
  end
end
