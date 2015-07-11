class BasketsController < ApplicationController
  before_action :find_basket, except: [:index, :new]
  before_action :find_item, only: [:edit, :update]
  before_action :set_category

  def index
    @baskets = Basket.all
  end

  def new
    @user = current_user
    @basket = @user.baskets.build
  end

  def create
    @user = current_user
    @basket = @user.baskets.first
    if @user.baskets.create(basket_params).save
      redirect_to basket_path(@basket.id)
    else
      render :new
    end
  end

  def edit
    @items = @basket.items
  end

  def update
    if @basket.update(basket_params)
      redirect_to basket_path(@basket.id)
    else
      render :edit
    end
  end

  def show
    @items = @basket.items.all
  end

  def destroy
    @basket.destroy
    redirect_to baskets_path
  end

  private
  def basket_params
    params.require(:basket).permit(:category, :time_frame, :instructions)
  end
  
  def find_basket
    @basket = Basket.find_by(id: params[:id])
    unless @basket
      render(text: 'not found', status: 404)
    end
  end

  def find_item
    @item = @basket.items.find_by(id: params[:id])
  end

  def category
    Basket.categories.include?(params[:category]) ? params[:category] : "Basket"
  end

  def category_class
    category.constantize
  end

  def set_category
    @category = category
  end
end
