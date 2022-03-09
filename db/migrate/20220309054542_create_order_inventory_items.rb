class CreateOrderInventoryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_inventory_items do |t|
      t.references :orders, index: true, foreign_key: true
      t.references :inventory_items, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
