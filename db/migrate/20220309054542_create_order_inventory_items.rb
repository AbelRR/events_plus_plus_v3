class CreateOrderInventoryItems < ActiveRecord::Migration[7.0]
  def up
    create_table :order_inventory_items do |t|
      t.belongs_to :order
      t.belongs_to :inventory_item

      t.timestamps null: false
    end
    add_index :order_inventory_items, [:inventory_item_id, :order_id], unique: true, name: "order_inventory_items_index"
  end
  def down
    remove_index :order_inventory_items, name: "order_inventory_items_index"
    execute <<-SQL
      DROP TABLE order_inventory_items CASCADE;
    SQL
  end
end
