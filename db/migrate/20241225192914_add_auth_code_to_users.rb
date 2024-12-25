class AddAuthCodeToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :auth_code, :string
  end
end
