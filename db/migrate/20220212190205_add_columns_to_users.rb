class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :line_id, :string
    add_column :users, :residence, :string
    add_column :users, :birth_date, :date
  end
end
