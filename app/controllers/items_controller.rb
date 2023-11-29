class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    if @item.save
      redirect_to root_path, notice: '商品を出品しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.all
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end