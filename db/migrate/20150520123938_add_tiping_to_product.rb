class AddTipingToProduct < ActiveRecord::Migration
  def change
    add_column :products, :tiping_id, :integer
  end
end
