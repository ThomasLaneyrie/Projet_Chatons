class Cart < ApplicationRecord
  belongs_to :user
  has_one :order

  has_many :line_carts
  has_many :items, through: :line_carts

end
