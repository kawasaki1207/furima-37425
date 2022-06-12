require 'rails_helper'

RSpec.describe OrderCard, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_card = FactoryBot.build(:order_card, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '商品購入できる場合' do
      it '全ての項目に値が存在すれば購入できる' do
        expect(@order_card).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_card.building = ''
        expect(@order_card).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空だと購入できない' do
        @order_card.post_code = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include "Post code can't be blank"
      end
      it 'cityが空だと購入できない' do
        @order_card.city = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空だと購入できない' do
        @order_card.address = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include "Address can't be blank"
      end
      it 'telが空だと購入できない' do
        @order_card.tel = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include "Tel can't be blank"
      end
      it 'prefecture_idが空だと購入できない' do
        @order_card.prefecture_id = 0
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'userが紐付いていないと購入できない' do
        @order_card.user_id = nil
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと購入できない' do
        @order_card.item_id = nil
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空だと購入できない' do
        @order_card.token = ''
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include "Token can't be blank"
      end
      it 'post_cordにハイフンがないと購入できない' do
        @order_card.post_code = '1234567'
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include 'Post code is invalid. Include hyphen(-)'
      end
      it 'telにハイフンがあると購入できない' do
        @order_card.tel = '123-1234-1234'
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include 'Tel is invalid'
      end
      it 'telが10桁以下だと購入できない' do
        @order_card.tel = '123456789'
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include 'Tel is invalid'
      end
      it 'telが11桁以上だと購入できない' do
        @order_card.tel = '123456789100'
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include 'Tel is invalid'
      end

      it 'telが全角だと購入できない' do
        @order_card.tel = '１２３４５６７８９０'
        @order_card.valid?
        expect(@order_card.errors.full_messages).to include 'Tel is invalid'
      end
    end
  end
end
