class ChangeProviderIdToWorkId < ActiveRecord::Migration[6.1]
  def change
    rename_column :introductions, :provider_id, :work_id
  end
end
