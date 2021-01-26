require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '情報が正常であれば出品可能' do
      expect(@item).to be_valid
    end

    it '画像が空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '名前が空だと保存できない' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it '説明が空だと保存できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーが空だと保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '状態が空だと保存できない' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State can't be blank")
    end

    it '配送手数料が空だと保存できない' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end

    it '発送地域が空だと保存できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数が空だと保存できない' do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end

    it '値段が空だと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '値段が300未満だと保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '値段が10000000以上だと保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 10000000')
    end
    
    it '値段が全角だと保存できない' do
      @item.price = "あ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    
    it '値段が英数混合だと保存できない' do
      @item.price = "ad44"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '値段が半角英語だと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
