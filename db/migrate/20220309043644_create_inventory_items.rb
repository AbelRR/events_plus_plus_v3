class CreateInventoryItems < ActiveRecord::Migration[7.0]
  def up
    create_enum :inventory_type, ["none", "bounce_house", "canopy", "heater"]

    create_table :inventory_items do |t|
      t.enum :inventory_type, enum_type: "inventory_type", default: "none", null: false
      t.string :description
      t.integer :chairs
      t.integer :tables
      t.timestamps
    end
  end
  
  # There's no built in support for dropping enums, but you can do it manually.
  # You should first drop any table that depends on them.
  def down
    drop_table :inventory_items
  
    execute <<-SQL
      DROP TYPE inventory_type;
    SQL
  end
end
