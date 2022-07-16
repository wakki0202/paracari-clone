class CreateWorkProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :work_providers do |t|
      t.string :email

      t.timestamps
    end
  end
end
