class AddColumnsColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email_verified_at, :datetime
    add_column :users, :remember_token, :string
  end
end
