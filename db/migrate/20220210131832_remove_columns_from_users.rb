class RemoveColumnsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :affiliater_id, :string
    remove_column :users, :referrer_id, :string
    remove_column :users, :status, :string
  end
end
