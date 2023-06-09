class AdminMailer < ApplicationMailer
  default from: 'zaritus3@hotmail.com'  
	def order_mail(order)
		
		@order = order
		@cart = @order.cart
		@user = @order.user
	
		@admin = User.find_by(is_admin?: true)
	
		mail(to: @admin.email, subject: 'Nouvelle commande')
	end

end