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

    def is_current_user?
      if current_user == User.find(params[:id])
        return true
      else
        flash[:danger] = "Impossible de consulter un profil qui n'est pas le sien"
        redirect_to root_path
      end
    end

    def is_your_order?

      if (current_user.orders.include?Order.find(params[:id])) == true
        return true
      else
        flash[:danger] = "Impossible de consulter cette commande"
        redirect_to root_path
      end
    end

    def is_your_current_cart?
      if @current_cart == current_user.carts.find(params[:id])
        binding.pry
        return true
      else
        flash[:danger] = "Impossible d'accéder à un ancien panier, redirection vers votre panier actuel"
        redirect_to panier_path(@current_cart.id)
      end
    end

    # protected
    # def configure_permitted_paramters
    #   devise_parameter
    # end
  end