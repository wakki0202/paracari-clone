class AddRemoveImagesToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :remove_images, :string
  end
end
