class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :title
      t.string :company
      t.string :reward
      t.string :pcontent
      t.string :rday
      t.string :rcontent
      t.string :area
      t.string :appeal

      t.timestamps
    end
  end
end
