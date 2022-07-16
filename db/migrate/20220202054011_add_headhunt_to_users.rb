class AddHeadhuntToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :headhunt, :boolean
  end
end
