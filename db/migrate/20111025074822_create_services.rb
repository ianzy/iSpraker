class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :uid
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
