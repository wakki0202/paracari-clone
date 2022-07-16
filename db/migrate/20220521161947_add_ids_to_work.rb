class AddIdsToWork < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :id_second, :string
    add_column :works, :id_third, :string
  end
end
