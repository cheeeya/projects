class AddLiveDefaultAlbums < ActiveRecord::Migration[5.1]
  def change
    change_column :albums, :live, :boolean, default: false
  end
end
