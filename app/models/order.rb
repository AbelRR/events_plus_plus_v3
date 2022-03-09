class Order < ApplicationRecord
  has_many :order_inventory_items
  has_many :inventory_items, through: :order_inventory_items
end
