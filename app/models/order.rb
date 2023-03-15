class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  # validates :cart, uniqueness: true       
end
