class CreateInventoryItems < ActiveRecord::Migration[7.0]
  def up
    create_enum :type, ["none", "bounce_house", "canopy", "heater"]

    create_table :inventory_items do |t|
      t.enum :type, enum_type: "type", default: "none", null: false
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
      DROP TYPE type;
    SQL
  end
end
