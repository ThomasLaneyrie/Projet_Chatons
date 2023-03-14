class CartsController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def show
    @cart = Cart.find(params[:id])
    @render_cart = false
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end
  
  def create
    Cart.find_by(user_id: current_user.id)   
    if @cart.nil?
      @cart = Cart.create(user_id: current_user.id)
    end		
  end
end
