class InventoryItem < ApplicationRecord
  has_many :order_inventory_items
  has_many :inventory_items, through: :order_inventory_items

  validate :must_have_inventory_item_or_other_items

  def must_have_inventory_item_or_other_items
    if inventory_item_type == "none" and !(chairs|| tables)
      errors.add(:inventory_item_type, "cannot be 'none' when if no chairs or tables are selected.")
    end
  end
end
