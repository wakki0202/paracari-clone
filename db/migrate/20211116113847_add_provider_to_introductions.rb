class AddProviderToIntroductions < ActiveRecord::Migration[6.1]
  def change
    add_reference :introductions, :provider, null: false, foreign_key: true
  end
end
