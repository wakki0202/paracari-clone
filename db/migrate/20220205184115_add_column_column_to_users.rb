class AddColumnColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :invitername, :string
    add_column :users, :inviteremail, :string
    add_column :users, :invitertel, :string
  end
end
