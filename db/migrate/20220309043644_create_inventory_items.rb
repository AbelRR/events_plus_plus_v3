class CreateInventoryItems < ActiveRecord::Migration[7.0]
  def up
    create_enum :item_category, ["item_with_count", "item_with_dimensions"]

    create_table :inventory_items do |t|
      t.string :title, null: false

      t.timestamps
    end

    create_table :inventory_item_details do |t|
      t.belongs_to :inventory_item, index: { unique: true }, foreign_key: true
      t.enum :category, enum_type: "item_category", default: "item_with_count", null: false
      t.string :description
      t.integer :count
      t.string :dimensions

      t.timestamps
    end
  end
  
  # There's no built in support for dropping enums, but you can do it manually.
  # You should first drop any table that depends on them.
  def down
    drop_table :inventory_item_details
    drop_table :inventory_items
  
    execute <<-SQL
      DROP TYPE item_category;
    SQL
  end
end
