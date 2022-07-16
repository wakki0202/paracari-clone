class AddReferencesToDetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :details, :user, foreign_key: true
    add_reference :details, :provider, foreign_key: true
  end
end
