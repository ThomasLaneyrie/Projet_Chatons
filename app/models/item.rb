class Item < ApplicationRecord
  belongs_to :category

  has_many :ordered_items                  
  has_many :orders, through: :ordered_items   

  has_many :line_carts
  has_many :carts, through: :line_carts
end
