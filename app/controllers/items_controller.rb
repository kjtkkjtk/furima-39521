class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  before_action :find_item, only: [:edit, :update]
  before_action :check_user_owns_item, only: [:edit, :update]

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
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品を更新しました。'
    else
      flash.now[:alert] = '入力に誤りがあります'
      render :edit
    end
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
  
  def check_user_owns_item
    unless current_user && @item && @item.user == current_user
      flash[:alert] = "他のユーザーの商品は編集できません。"
      redirect_to root_path
    end
  end
end