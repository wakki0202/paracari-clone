class AddPositionToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :position, :integer
  end
end
