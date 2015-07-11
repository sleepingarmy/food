class ItemsController < ApplicationController
  before_action :find_item, only: [:edit, :show, :delete, :update]

  def index
    @items = @basket.items.all
  end

  def new
    @item = @basket.items.build
  end

  def create
    if @basket.item.create(item_params).save
      redirect_to basket_path(@basket.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to basket_path(@basket.id)
    else 
      render :edit
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to basket_path(@basket.id)
  end

  private
  def item_params
    params.require(:item).permit(:name, :quantity, :brand, :instructions)
  end

  def find_item
    @item = Item.find_by(id: params[:id])
  end

end
