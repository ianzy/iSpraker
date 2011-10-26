class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :url
      t.decimal :lat
      t.decimal :lng
      t.string :address
      t.datetime :event_time

      t.timestamps
    end
  end
end
