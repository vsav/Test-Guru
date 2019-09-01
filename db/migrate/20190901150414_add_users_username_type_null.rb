class AddUsersUsernameTypeNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null(:users, :username, false)
    change_column_null(:users, :type, false)
  end

  def down
    change_column_null(:users, :username, true)
    change_column_null(:users, :type, true)
  end
end
