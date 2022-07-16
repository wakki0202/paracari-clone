class ChangeScoutToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :scout
    add_column :users, :scout, :boolean
  end
end
