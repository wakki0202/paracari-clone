class ChangeAreaToProvider < ActiveRecord::Migration[6.1]
  def change
    change_column :providers, :area, :text
  end
end
