class AddRefenerces < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :category, foreign_key: { to_table: :categories }
    add_reference :questions, :test, foreign_key: { to_table: :tests }
    add_reference :answers, :question, foreign_key: { to_table: :questions }
  end
end

