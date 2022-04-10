# frozen_string_literal: true

module Types
  class InventoryItemDetailType < Types::BaseObject
    field :id, ID, null: false
    field :category, Enums::ItemCategory, null: false
    field :description, String
    field :count, Integer
    field :dimensions, String
    field :inventory_item_id, Integer

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
