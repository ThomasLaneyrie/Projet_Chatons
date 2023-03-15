class OrdersController < ApplicationController
  def create
  end

  def show
    @order = Order.find(params[:id])
  end
end
