# frozen_string_literal: true

module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :client, Types::UserType, null: false
    field :created_by, Types::UserType, null: false
    field :delivery_date_time, String, null: false
    field :return_date_time, String, null: false
    field :location, String, null: false
    field :rent_price, Integer, null: false
    field :deposit_amount, Integer, null: false
    field :notes, String, null: false
    field :inventory_items, [Types::InventoryItemType]

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
