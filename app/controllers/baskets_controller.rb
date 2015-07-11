class BasketsController < ApplicationController
  before_action :find_basket

  def show
    @items = @basket.items
  end

  private
  
  def find_basket
    @basket = Basket.find_by(id: params[:id])
    unless @basket
      render(text: 'not found', status: 404)
    end
  end
end
