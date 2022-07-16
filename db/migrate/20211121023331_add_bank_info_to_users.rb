class AddBankInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :bank, :string
    add_column :users, :branch, :string
    add_column :users, :kinds, :string
    add_column :users, :banknumber, :string
  end
end
