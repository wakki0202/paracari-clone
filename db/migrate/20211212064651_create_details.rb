class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.text :content

      t.timestamps
    end
  end
end
