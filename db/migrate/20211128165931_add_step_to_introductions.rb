class AddStepToIntroductions < ActiveRecord::Migration[6.1]
  def change
    add_column :introductions, :step, :string
  end
end
