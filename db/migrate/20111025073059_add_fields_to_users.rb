class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lat, :decimal
    add_column :users, :lng, :decimal
    add_column :users, :token, :string
    add_column :users, :secret, :string
    add_column :users, :uid, :string
    add_column :users, :screen_name, :string
    add_column :users, :profile_image_url, :string
    add_column :users, :description, :string
    add_column :users, :time_zone, :string
  end
end
