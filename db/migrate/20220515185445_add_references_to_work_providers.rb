class AddReferencesToWorkProviders < ActiveRecord::Migration[6.1]
  def change
    add_reference :work_providers, :work, foreign_key: true
  end
end
