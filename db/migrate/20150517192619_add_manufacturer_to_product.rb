class AddManufacturerToProduct < ActiveRecord::Migration
  def change
    add_column :products, :manufacturer_id, :integer
    add_column :products, :manufacturer_title_id, :integer
  end
end
