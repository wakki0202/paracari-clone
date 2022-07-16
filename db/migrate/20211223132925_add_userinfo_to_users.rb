class AddUserinfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :career, :text
    add_column :users, :appeal, :text
  end
end
