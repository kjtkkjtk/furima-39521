class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show]
  before_action :find_item, only: [:edit, :update, :show, :destroy]
  before_action :check_user_owns_item, only: [:edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)

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
    
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品を更新しました。'
    else
      flash.now[:alert] = '入力に誤りがあります'
      render :edit
    end
  end

  def destroy
    puts "Before destroy action"
    if @item.user == current_user
      @item.destroy
      puts "Item destroyed"
      redirect_to root_path, notice: '商品を削除しました。'
    else
      puts "User doesn't own the item"
      redirect_to root_path, alert: '他のユーザーの商品は削除できません。'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, :price)
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