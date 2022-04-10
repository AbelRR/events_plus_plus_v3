module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :clients_by_phone, [Types::UserType], null: false do
      # Passing arguemts used to identify user
      argument :partial_phone_number, String, required: false
    end
    def clients_by_phone(partial_phone_number:)
      return User.none if partial_phone_number.empty?
      User.clients.where('phone_number ILIKE ?', "%#{partial_phone_number}%")
    end

    field :user, Types::UserType, null: false do
      # Passing arguemts used to identify user
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    field :admins, [Types::UserType], null: false
    def admins
      User.admins
    end

    field :inventory_items, [Types::InventoryItemType], null: false
    def inventory_items
      InventoryItem.all
    end

    field :inventory_item, Types::InventoryItemType, null: false do
      argument :id, ID, required: true
    end
    def inventory_item(id:)
      InventoryItem.find(id)
    end

    field :orders, [Types::OrderType], null: false
    def orders
      Order.all
    end

    field :order, Types::OrderType, null:false do
      argument :id, ID, required: true
    end
    def order(id:)
      Order.find(id)
    end

    field :order_inventory_items, [Types::OrderInventoryItemType], null: false
    def order_inventory_items
      OrderInventoryItem.all
    end
  end
end
