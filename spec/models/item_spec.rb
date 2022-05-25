require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '出品登録ができる時' do
      it "全ての項目に値が存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '出品登録できない場合' do
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "contentが空だと出品できない" do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Content can't be blank"
      end
      it "category_idを選択していないと出品できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "status_idを選択していないと出品できない" do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "delivery_charge_idを選択していないと出品できない" do
        @item.delivery_charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
      end
      it "prefecture_idを選択していないと出品できない" do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "shopping_day_idを選択していないと出品できない" do
        @item.shopping_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shopping day can't be blank"
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "Userが紐付いていないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
      it "画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "priceが半角数字以外だと出品できない" do
        @item.price = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it "priceが¥300~¥9,999,999以外だと出品できない" do
        @item.price = '100'
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
    end
  end
end
