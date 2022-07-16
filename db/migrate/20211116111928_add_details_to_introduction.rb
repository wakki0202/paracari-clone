class AddDetailsToIntroduction < ActiveRecord::Migration[6.1]
  def change
    add_column :introductions, :name, :string
    add_column :introductions, :phonenumber, :string
    add_column :introductions, :contents, :text
  end
end
