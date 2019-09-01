class ChangeTestsLevelDefault < ActiveRecord::Migration[6.0]
  def up
    change_column_default(:tests, :level, 0)
  end

  def down
    change_column_default(:tests, :level, nil)
  end
end
