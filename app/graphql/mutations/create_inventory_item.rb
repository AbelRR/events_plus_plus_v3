module Mutations
  class CreateInventoryItem < BaseMutation
    argument :inventory_item_type, Types::Enums::InventoryItemType, required: true
    argument :description, String, required: false
    argument :chairs, Integer, required: false
    argument :tables, Integer, required: false

    type Types::InventoryItemType

    def resolve(**attributes)
      InventoryItem.create!(attributes)
    end
  end
end