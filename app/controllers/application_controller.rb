class ApplicationController < ActionController::Base
    before_action :set_render_cart
    before_action :initialize_cart

    def set_render_cart
      @render_cart = true
    end
  
  
    #if user pas sign in panier libre mais faut se connecter apres
    #if user connecte lui cree son panier

    def initialize_cart
      if current_user != nil
			@current_cart =	Cart.where(user_id: current_user.id).last
								
					if @current_cart == nil
						@current_cart = Cart.create(user_id: current_user.id)
					end
			end
    end
  end