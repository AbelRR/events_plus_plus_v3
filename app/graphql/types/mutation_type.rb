module Types
  class MutationType < Types::BaseObject
    field :create_admin, mutation: Mutations::CreateAdmin
    field :create_client, mutation: Mutations::CreateClient
    field :create_driver, mutation: Mutations::CreateDriver
    field :create_order, mutation: Mutations::CreateOrder
    field :add_item_with_count, mutation: Mutations::AddItemWithCount
    field :add_item_with_dimensions, mutation: Mutations::AddItemWithDimensions
  end
end
