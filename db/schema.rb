# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_09_054542) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "inventory_type", ["none", "bounce_house", "canopy", "heater"]
  create_enum "user_role", ["admin", "driver", "client"]

  create_table "inventory_items", force: :cascade do |t|
    t.enum "inventory_type", default: "none", null: false, enum_type: "inventory_type"
    t.string "description"
    t.integer "chairs"
    t.integer "tables"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_inventory_items", force: :cascade do |t|
    t.bigint "orders_id"
    t.bigint "inventory_items_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_items_id"], name: "index_order_inventory_items_on_inventory_items_id"
    t.index ["orders_id"], name: "index_order_inventory_items_on_orders_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "client_id"
    t.integer "created_by_id"
    t.datetime "delivery_date_time"
    t.datetime "return_date_time"
    t.string "location"
    t.integer "rent_price"
    t.integer "deposit_amount"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "user_role", default: "client", null: false, enum_type: "user_role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
  end

  add_foreign_key "order_inventory_items", "inventory_items", column: "inventory_items_id"
  add_foreign_key "order_inventory_items", "orders", column: "orders_id"
end
