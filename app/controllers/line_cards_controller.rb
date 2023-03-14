class LineCardsController < ApplicationController
  def destroy
    @line_card = LineCard.find(params[:id])
    @line_card.destroy
    redirect_to panier_path(@current_cart)
  end
end
