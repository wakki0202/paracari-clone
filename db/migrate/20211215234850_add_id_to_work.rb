class AddIdToWork < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :provider_id, :integer
    add_column :works, :admin_id, :integer
  end
end
