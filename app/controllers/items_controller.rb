class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    if @item.save
      
      redirect_to items_path, notice: '商品を出品しました。'
    else
      
      render :new, status: :unprocessable_entity
    end
  end

  
  
  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, :price)
  end
end