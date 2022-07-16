class AddPemissionToIntroduction < ActiveRecord::Migration[6.1]
  def change
    add_column :introductions, :permission, :boolean, default: false, null: false
  end
end
