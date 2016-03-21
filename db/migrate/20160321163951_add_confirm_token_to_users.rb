class AddConfirmTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirm_token, :string, unique: true
  end
end
