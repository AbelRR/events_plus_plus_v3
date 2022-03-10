module Types
  module Enums
    class InventoryItemType < Types::BaseEnum
      description 'Type of Inventory Item'

      value "none", value: "none"
      value "bounce_house", value: "bounce_house"
      value "canopy", value: "canopy"
      value "heater", value: "heater"
    end
  end
end