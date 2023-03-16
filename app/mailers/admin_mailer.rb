class AdminMailer < ApplicationMailer

	def order_email(order)
		@order = order
		@cart = @order.cart
		@user = @order.user
	
		@admin = User.find_by(is_admin: true)

		mail(to: @admin.email, subject: 'Nouvelle commande')
	
	end

end