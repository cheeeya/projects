class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :live, null: false
      t.integer :band_id, null: false

      t.timestamps
    end

    drop_table :a_lbums
  end
end
