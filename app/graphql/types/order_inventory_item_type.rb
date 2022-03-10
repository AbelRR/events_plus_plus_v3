# frozen_string_literal: true

module Types
  class OrderInventoryItemType < Types::BaseObject
    field :id, ID, null: false  
    field :orders_id, Integer, null: false
    field :inventory_items_id, Integer, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
