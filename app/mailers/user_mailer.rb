class UserMailer < ApplicationMailer
  default from: 'zaritus3@hotmail.com'  
	def purchase_mail(order)
		@order = order
		@cart = @order.cart
		mail(to: @order.user.email, subject: 'Commande')
	end


	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Bienvenue sur Kwiskas !')
	end
end