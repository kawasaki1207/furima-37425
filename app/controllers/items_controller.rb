class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name,:content,:category_id,:status_id,:delivery_charge_id,:prefecture_id,:shopping_day_id,:price).merge(user_id: current_user.id)
  end
end
