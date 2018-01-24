class ChangeUserTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :email
    add_column :users, :username, :string, null: false
  end
end
