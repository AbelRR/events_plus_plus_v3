class CreateOrders < ActiveRecord::Migration[7.0]
  def up
    create_table :orders do |t|
      t.integer :client_id, null: false
      t.integer :created_by_id, null: false
      t.datetime :delivery_date_time, null: false
      t.datetime :return_date_time, null: false
      t.string :location, null: false
      t.integer :rent_price, null: false
      t.integer :deposit_amount, null: false, default: 0
      t.string :notes, null: false, default: ''

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
