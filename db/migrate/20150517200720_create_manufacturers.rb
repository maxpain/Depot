class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :title
      t.string :description
      t.string :country
      t.string :city

      t.timestamps null: false
    end
  end
end
