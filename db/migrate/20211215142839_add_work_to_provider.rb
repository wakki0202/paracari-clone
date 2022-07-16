class AddWorkToProvider < ActiveRecord::Migration[6.1]
  def change
    add_reference :providers, :work, foreign_key: true
  end
end
