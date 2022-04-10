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
  create_enum "item_category", ["item_with_count", "item_with_dimensions"]
  create_enum "user_role", ["admin", "driver", "client"]

  create_table "inventory_item_details", force: :cascade do |t|
    t.bigint "inventory_item_id"
    t.enum "category", default: "item_with_count", null: false, enum_type: "item_category"
    t.string "description"
    t.integer "count"
    t.string "dimensions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id"], name: "index_inventory_item_details_on_inventory_item_id", unique: true
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_inventory_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "inventory_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_item_id", "order_id"], name: "order_inventory_items_index", unique: true
    t.index ["inventory_item_id"], name: "index_order_inventory_items_on_inventory_item_id"
    t.index ["order_id"], name: "index_order_inventory_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "created_by_id", null: false
    t.datetime "delivery_date_time", null: false
    t.datetime "return_date_time", null: false
    t.string "location", null: false
    t.integer "rent_price", null: false
    t.integer "deposit_amount", default: 0, null: false
    t.string "notes", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "email"
    t.string "phone_number", null: false
    t.enum "user_role", default: "client", null: false, enum_type: "user_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
  end

  add_foreign_key "inventory_item_details", "inventory_items"
end
