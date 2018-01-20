class AddShortUrlId < ActiveRecord::Migration[5.1]
  def change
    add_column :visits, :short_url_id, :integer
    remove_column :visits, :short_url, :string
      
  end
end
