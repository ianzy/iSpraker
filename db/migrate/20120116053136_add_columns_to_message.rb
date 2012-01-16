class AddColumnsToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :sender_name, :string
    add_column :messages, :sender_profile_image_url, :string
  end
end
