class CreateIntroductions < ActiveRecord::Migration[6.1]
  def change
    create_table :introductions do |t|

      t.timestamps
    end
  end
end
