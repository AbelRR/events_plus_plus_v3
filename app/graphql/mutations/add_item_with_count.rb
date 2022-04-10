module Mutations
  class AddItemWithCount < BaseMutation
    argument :title, String, required: true
    argument :count, Integer, required: true
    argument :description, String, required: false

    type Types::InventoryItemType

    def resolve(title:, count:, description:)
      puts title
      puts "title"
      puts count
      puts "count"
      puts description
      puts "description"
      item = InventoryItem.create!(title: title)
      category = :item_with_count
      args = {
        category: category,
        count: count,
        description: description,
        inventory_item_id: item.id
      }
      InventoryItemDetail.create!(args).as_json
      item
    end
  end
end