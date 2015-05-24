class AddSendUserIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :send_user_id, :integer
  end
end
