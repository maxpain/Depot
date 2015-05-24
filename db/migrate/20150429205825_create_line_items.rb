class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :count
      t.float :total_price
      t.timestamps null: false
    end
  end
end
