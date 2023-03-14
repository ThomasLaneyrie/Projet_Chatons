class LineCart < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  #alcul du total le reste dans le modele cart
  def total_price
    self.quantity * self.item.price
  end
end
