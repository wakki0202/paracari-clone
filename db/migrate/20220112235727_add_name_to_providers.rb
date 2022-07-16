class AddNameToProviders < ActiveRecord::Migration[6.1]
  def change
    add_column :providers, :name, :string
  end
end
