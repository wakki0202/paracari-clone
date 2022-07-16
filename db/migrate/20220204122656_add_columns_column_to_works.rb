class AddColumnsColumnToWorks < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :sheet_id, :string
    add_column :works, :google_account, :string
    add_column :works, :work_overview, :string
    add_column :works, :form_overview, :string
    add_column :works, :form_detail, :string
    add_column :works, :display_order, :string
  end
end
