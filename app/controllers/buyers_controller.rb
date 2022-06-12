class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]

  def index
    @order_card = OrderCard.new
  end

  def create
    @order_card = OrderCard.new(buyer_params)
    if @order_card.valid?
      pay_item
      @order_card.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:order_card).permit(:post_code, :city, :address, :building, :tel, :prefecture_id).merge(token: params[:token],
                                                                                                           user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.buyer.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
