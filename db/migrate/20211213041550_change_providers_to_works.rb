class ChangeProvidersToWorks < ActiveRecord::Migration[6.1]
  def change
    rename_table :providers, :works
  end
end
