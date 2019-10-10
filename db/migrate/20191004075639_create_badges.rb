class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.text :title, null: false
      t.text :img_url
      t.text :condition

      t.timestamps
    end
  end
end
