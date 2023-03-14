class Item < ApplicationRecord
  belongs_to :category

  has_many :line_carts
  has_many :carts, through: :line_carts
end
