class ROllBack < ActiveRecord::Migration[5.1]
  def change
    drop_table :sessions
    add_column :users, :session_token, :string, null: false
  end
end
