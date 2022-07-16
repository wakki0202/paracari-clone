class AddCommentToIntroduction < ActiveRecord::Migration[6.1]
  def change
    add_column :introductions, :comment, :text
  end
end
