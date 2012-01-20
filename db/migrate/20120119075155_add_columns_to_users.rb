class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :real_name, :string
    add_column :users, :position, :string
    add_column :users, :company, :string
    add_column :users, :interests, :string
  end
end
