class LineCartsController < ApplicationController
  def create
      # trouver un produit et le panier courant
      chosen_item = Item.find(params[:item_id])
      current_cart = @current_cart
      # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
      	if current_cart.items.include?(chosen_item)
      # Find the line_cart with the chosen_product
      		@line_cart = current_cart.line_carts.find_by(:item_id => chosen_item)
      # Iterate the line_item's quantity by one
      # et initialiser la quantité à 0 avant itération
       		@line_cart.quantity += 1
    		else
      		@line_cart = LineCart.new
					@line_cart.quantity = 1

      		@line_cart.cart = current_cart
      		@line_cart.item = chosen_item
    	end
    # Save and redirect to cart show path
      		@line_cart.save
     			redirect_to root_path
  end
  
  def destroy
    @line_cart = LineCart.find(params[:id])
    @line_cart.destroy
    redirect_to panier_path(@line_cart.cart)
  end

  def add_quantity
    @line_cart = LineCart.find(params[:id])
    @line_cart.quantity += 1
    @line_cart.save
    redirect_to panier_path(@line_cart.cart)
  end

  def reduce_quantity
    @line_cart = LineCart.find(params[:id])
    if @line_cart.quantity > 1 
      @line_cart.quantity -= 1
      @line_cart.save
    end
    redirect_to panier_path(@line_cart.cart)
  end
  
end
