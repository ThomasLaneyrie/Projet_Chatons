class Cart < ApplicationRecord
  belongs_to :user
  has_one :order

  has_many :line_carts
  has_many :items, through: :line_carts

  #suite definition opur calculer le total

  def sub_total
    sum = 0
    self.line_carts.each do |line_cart|
      sum+= line_cart.total_price
    end
    return sum
  end

end
