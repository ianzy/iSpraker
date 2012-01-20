class ChangeColumnsMessage < ActiveRecord::Migration
  def up
    change_column :messages, :sender_id, :string
    change_column :messages, :receiver_id, :string
  end

  def down
    change_column :messages, :sender_id, :integer
    change_column :messages, :receiver_id, :integer
  end
end
