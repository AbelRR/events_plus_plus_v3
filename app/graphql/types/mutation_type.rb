module Types
  class MutationType < Types::BaseObject
    field :create_admin, mutation: Mutations::CreateAdmin
    field :create_client, mutation: Mutations::CreateClient
    field :create_driver, mutation: Mutations::CreateDriver
    field :create_order, mutation: Mutations::CreateOrder
    field :create_inventory_item, mutation: Mutations::CreateInventoryItem
    field :create_order_inventory_items, mutation: Mutations::CreateOrderInventoryItems
  end
end
