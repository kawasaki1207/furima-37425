class BuyersController < ApplicationController
  def index
    @buyer = Buyer.new
    @item = Item.find(params[:item_id])
    
  end

  def new
  end

  def create
  end
end
