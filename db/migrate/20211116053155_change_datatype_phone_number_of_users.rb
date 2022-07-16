class ChangeDatatypePhoneNumberOfUsers < ActiveRecord::Migration[6.1]
  def change
     change_column :users, :phonenumber, :string
  end
end
