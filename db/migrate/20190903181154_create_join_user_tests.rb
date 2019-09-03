class CreateJoinUserTests < ActiveRecord::Migration[6.0]
  def change
    create_table :join_user_tests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
