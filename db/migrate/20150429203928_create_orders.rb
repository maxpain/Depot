class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :fio
      t.string :email
      t.string :phone_number
      t.float :total_price
      t.integer :status

      t.timestamps null: false
    end
  end
end
