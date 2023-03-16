class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_your_order?, only: [:show]
  
  def show
    @order = Order.find(params[:id])
    @order_line_carts = @order.cart.line_carts
  end
end
