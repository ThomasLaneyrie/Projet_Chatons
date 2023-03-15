class Order < ApplicationRecord

  after_create :order_mail

  belongs_to :user
  belongs_to :cart

  # validates :cart, uniqueness: true      
  
  def order_mail
	  UserMailer.purchase_mail(self).deliver_now
	  AdminMailer.order_mail(self).deliver_now
  end
  
end
