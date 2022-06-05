class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer = Buyer.new(buyer_params)
   if @buyer.save
     redirect_to root_path
   else
     render :index
   end
  end

  private
  def buyer_params
    params.require(:buyer).permit(item_id: [], user_id:[])
  end
end
