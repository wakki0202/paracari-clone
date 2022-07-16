class AddImgToProviders < ActiveRecord::Migration[6.1]
  def change
    add_column :providers, :img, :string
  end
end
