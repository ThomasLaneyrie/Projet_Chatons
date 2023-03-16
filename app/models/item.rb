class Item < ApplicationRecord
  belongs_to :category

  has_many :line_carts
  has_many :carts, through: :line_carts

  validates :title, presence: true   
  validates :price, presence: true, numericality: { greater_than: 0 } 
  validates :description, presence: true   
  validates :image_url, presence: true

  def to_param
    title
  end
  
end
