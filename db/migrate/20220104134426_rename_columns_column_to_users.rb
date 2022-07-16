class RenameColumnsColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :phonenumber, :tel
    rename_column :users, :kinds, :account_type
    rename_column :users, :banknumber, :account_no
  end
end
