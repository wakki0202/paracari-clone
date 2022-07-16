class RemoveAdminIdFromWork < ActiveRecord::Migration[6.1]
  def change
    remove_column :works, :admin_id, :integer
  end
end
