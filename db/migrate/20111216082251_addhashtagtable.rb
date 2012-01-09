class Addhashtagtable < ActiveRecord::Migration
  def up
    create_table :hash_tags do |t|
      t.string :hash_tag
      t.decimal :lat
      t.decimal :lng
      t.integer :event_id
      t.timestamps
    end
  end

  def down
    drop_table :hash_tags
  end
end
