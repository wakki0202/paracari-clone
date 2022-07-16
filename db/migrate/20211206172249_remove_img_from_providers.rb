class RemoveImgFromProviders < ActiveRecord::Migration[6.1]
  def change
    remove_column :providers, :img, :string
  end
end
