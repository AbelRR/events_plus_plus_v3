module Types
  module Enums
    class ItemCategory < Types::BaseEnum
      description 'Category of Inventory Item'

      value "item_with_count", value: "item_with_count"
      value "item_with_dimensions", value: "item_with_dimensions"
    end
  end
end