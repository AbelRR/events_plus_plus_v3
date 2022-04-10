module Mutations
  class AddItemWithDimensions < BaseMutation
    argument :title, String, required: true
    argument :dimensions, String, required: true
    argument :description, String, required: false

    type Types::InventoryItemType

    def resolve(title:, dimensions:, description:)
      item = InventoryItem.create!(title: title)
      category = :item_with_dimensions
      args = {
        category: category,
        dimensions: dimensions,
        description: description,
        inventory_item_id: item.id
      }
      InventoryItemDetail.create!(args).as_json
      item
    end
  end
end