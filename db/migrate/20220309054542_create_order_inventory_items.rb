class CreateOrderInventoryItems < ActiveRecord::Migration[7.0]
  def up
    create_table :order_inventory_items do |t|
      t.belongs_to :order
      t.belongs_to :inventory_item

      t.timestamps null: false
    end
  end
  def down
    execute <<-SQL
      DROP TABLE order_inventory_items CASCADE;
    SQL
  end
end
