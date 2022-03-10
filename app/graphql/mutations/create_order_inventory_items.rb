module Mutations
  class CreateOrderInventoryItems < BaseMutation
    argument :inventory_item_ids, [Integer], required: true
    argument :order_id, Integer, required: true

    type [Types::OrderInventoryItemType]

    def resolve(
      inventory_item_ids:,
      order_id:
    )
      list = inventory_item_ids.map do |id|
        OrderInventoryItem.create!(
          orders_id: order_id,
          inventory_items_id: id,
        )
      end
      list
    end
  end
end