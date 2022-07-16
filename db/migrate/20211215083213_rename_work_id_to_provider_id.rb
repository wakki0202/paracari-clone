class RenameWorkIdToProviderId < ActiveRecord::Migration[6.1]
  def change
    rename_column :details, :provider_id, :work_id
  end
end
