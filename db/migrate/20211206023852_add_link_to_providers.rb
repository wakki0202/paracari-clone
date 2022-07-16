class AddLinkToProviders < ActiveRecord::Migration[6.1]
  def change
    add_column :providers, :link, :string
  end
end
