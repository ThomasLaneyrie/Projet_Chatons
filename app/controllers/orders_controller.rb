class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_your_order?, only: [:show]
  
  def show
    @order = Order.find(params[:id])
    @order_line_carts = @order.cart.line_carts

    @order_line_carts.each_with_index do |line_cart, index|
      line_cart.quantity
      item = line_cart.item
      item.title
      item.price
      end
  end
end
