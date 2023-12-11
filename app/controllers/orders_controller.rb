class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:index, :create]

  def create
    @orders_form = OrdersForm.new(orders_params)
  
    if @orders_form.valid?
      @orders_form.item_id = @item.id
      @orders_form.user_id = current_user.id
      @orders_form.save
      pay_item
      redirect_to root_path, notice: '購入が完了しました。'
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    redirect_to root_path, alert: '無効なリクエストです。' if @item.sold_out?
    @orders_form = OrdersForm.new
  end

  def new
    @orders_form = OrdersForm.new
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: @orders_form.token,
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])

    if @item.nil?
      redirect_to root_path, alert: '無効なリクエストです。'
    end
  end

  def orders_params
    params.require(:orders_form).permit(
      :postal_code,
      :prefecture_id,
      :city,
      :street,
      :building_name,
      :phone_number
    ).merge(token: params[:token], item_id: @item.id, user_id: current_user.id)
  end
end