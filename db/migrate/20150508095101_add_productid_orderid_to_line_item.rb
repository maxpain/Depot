class AddProductidOrderidToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :product_id, :integer
    add_column :line_items, :order_id, :integer
    
    change_column :line_items, :product_id, :integer, :null => false
    change_column :line_items, :order_id, :integer, :null => false
  end
end
