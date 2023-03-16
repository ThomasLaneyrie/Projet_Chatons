class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_your_order?, only: [:show]
  
  def show
    @order = Order.find(params[:id])
  end
end
