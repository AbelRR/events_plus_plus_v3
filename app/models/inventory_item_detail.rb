class InventoryItemDetail < ApplicationRecord
  belongs_to :inventory_item, foreign_key: true, optional: true
end
