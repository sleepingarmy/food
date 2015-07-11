class BasketsController < ApplicationController
  before_action :find_basket, only: [:edit, :show, :delete, :update]
  before_action :set_type

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

  def edit 
  end

  def update
    if @basket.update
      redirect_to basket_path(@basket.id)
    else
      render :edit
    end
  end

  def show
    @items = @basket.items
  end

  def destroy
    @basket.destroy
    redirect_to baskets_path
  end

  private
  def basket_params
    params.require(:basket).permit(:type, :time_frame, :instructions)
  end
  
  def find_basket
    @basket = Basket.find_by(id: params[:id])
    unless @basket
      render(text: 'not found', status: 404)
    end
  end

  def type
    Basket.types.include?(params[:type]) ? params[:type] : "Basket"
  end

  def type_class
    type.constantize
  end
  
  def set_type
    @type = type
  end
end
