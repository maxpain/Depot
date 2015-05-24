class CreateTipings < ActiveRecord::Migration
  def change
    create_table :tipings do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
