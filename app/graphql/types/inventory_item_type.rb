# frozen_string_literal: true

module Types
  class InventoryItemType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :inventory_item_detail, Types::InventoryItemDetailType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
