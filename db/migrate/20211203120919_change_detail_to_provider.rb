class ChangeDetailToProvider < ActiveRecord::Migration[6.1]
  def change
    change_column :providers, :pcontent, :text
    change_column :providers, :rcontent, :text
    change_column :providers, :appeal, :text
  end
end
