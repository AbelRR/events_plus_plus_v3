# frozen_string_literal: true

module Types
  class InventoryItemType < Types::BaseObject
    field :id, ID, null: false
    field :inventory_item_type, Enums::InventoryItemType, null: false
    field :description, String
    field :chairs, Integer
    field :table, Integer

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
