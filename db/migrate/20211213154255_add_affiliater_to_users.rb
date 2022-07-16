class AddAffiliaterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users,:affiliater_id, :string
    add_column :users,:referrer_id, :string 
  end
end
