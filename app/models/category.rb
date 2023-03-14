class Category < ApplicationRecord
  has_many :items
  validates :type_category, presence: true   
end
