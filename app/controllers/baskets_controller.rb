class BasketsController < ApplicationController
  before_action :find_basket, only: [:edit, :show, :delete, :update]

  def index
    @baskets = Basket.all
  end

  def new
    @basket = Basket.new
  end

  def create
    if @basket.create(basket_params).save
      redirect_to basket_path(@basket.id)
    else
      render :new
    end
  end

  def show
    @items = @basket.items
  end

  private
  
  def find_basket
    @basket = Basket.find_by(id: params[:basket_id])
    unless @basket
      render(text: 'not found', status: 404)
    end
  end
end
