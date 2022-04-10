class Order < ApplicationRecord
  has_many :order_inventory_items
  has_many :inventory_items, through: :order_inventory_items

  belongs_to :client, class_name: 'User', foreign_key: 'client_id'
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id' 
end
