class UserMailer < ApplicationMailer
  default from: 'zaritus3@hotmail.com'  
	def purchase_mail(order)
		@order = order
		@cart = @order.cart
		mail(to: @order.user.email, subject: 'Commande')
	end

end