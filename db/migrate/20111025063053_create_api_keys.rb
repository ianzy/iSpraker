class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :key
      t.boolean :public_access

      t.timestamps
    end
  end
end
