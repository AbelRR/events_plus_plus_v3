class CreateOrders < ActiveRecord::Migration[7.0]
  def up
    create_table :orders do |t|
      t.integer :client_id
      t.integer :created_by_id
      t.datetime :delivery_date_time
      t.datetime :return_date_time
      t.string :location
      t.integer :rent_price
      t.integer :deposit_amount
      t.string :notes

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
