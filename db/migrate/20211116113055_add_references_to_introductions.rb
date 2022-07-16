class AddReferencesToIntroductions < ActiveRecord::Migration[6.1]
  def change
    add_reference :introductions, :user, null: false, foreign_key: true
    
  end
end
