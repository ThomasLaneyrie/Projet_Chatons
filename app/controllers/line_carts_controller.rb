class LineCartsController < ApplicationController
  def create
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
