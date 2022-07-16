class AddUserToScout < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :scout, :string
  end
end
