class Cart < ApplicationRecord
  belongs_to :user

  has_many :line_carts, dependent: :destroy
  has_many :items, through: :line_carts

end
