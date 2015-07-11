class BasketsController < ApplicationController
  before_action :find_basket

  def index
    @baskets = Basket.all
  end

  def show
    @items = @basket.items
  end

  private
  
  def find_basket
    @basket = Basket.find_by(id: params[:basket_id])
    binding.pry
    unless @basket
      render(text: 'not found', status: 404)
    end
  end
end
