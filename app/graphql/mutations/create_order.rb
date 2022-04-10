module Mutations
  class CreateOrder < BaseMutation
    argument :inventory_item_ids, [Integer], required: true
    argument :client_id, Integer, required: true
    argument :created_by_id, Integer, required: true
    argument :delivery_date_time, String, required: true
    argument :return_date_time, String, required: true
    argument :location, String, required: true
    argument :rent_price, Integer, required: true
    argument :deposit_amount, Integer, required: true
    argument :notes, String, required: false

    type Types::OrderType

    def resolve(
      inventory_item_ids:,
      client_id:,
      created_by_id:,
      delivery_date_time:,
      return_date_time:,
      location:,
      rent_price:,
      deposit_amount:,
      notes:
    )
      delivery_date_time_ts = delivery_date_time.to_datetime
      return_date_time_ts = return_date_time.to_datetime

      order = Order.create!(
        client_id: client_id,
        created_by_id: created_by_id,
        delivery_date_time: delivery_date_time,
        return_date_time: return_date_time,
        location: location,
        rent_price: rent_price,
        deposit_amount: deposit_amount,
        notes: notes,
      )

      inventory_item_ids.map do |id|
        OrderInventoryItem.create!(
          order_id: order.id,
          inventory_item_id: id,
        ).inventory_item.as_json
      end

      order
    end
  end
end