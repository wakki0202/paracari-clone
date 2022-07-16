class AddCompanynameToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :company_name, :string
  end
end
