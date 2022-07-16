class AddImagesToProviders < ActiveRecord::Migration[6.1]
  def change
    add_column :providers, :images, :string
  end
end
