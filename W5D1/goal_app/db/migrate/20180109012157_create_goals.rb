class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.boolean :private, default: true
      t.text :body, null: false
      t.timestamps
    end
    add_index :goals, :user_id
  end
end
