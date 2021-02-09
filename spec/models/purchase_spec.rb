require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '#create' do
    before do
      @purchase = FactoryBot.build(:purchase)
    end

    context '購入可能な時' do
      it 'すべての情報が入力されている時は購入可能' do
        expect(@purchase).to be_valid
      end

      it 'buildingが空でも購入可能' do
        @purchase.building = nil
        expect(@purchase).to be_valid
      end
    end

    context '購入不可能な時' do
      it 'tokenが空の場合購入不可' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空の場合購入不可' do
        @purchase.postal_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeに-がない場合購入不可' do
        @purchase.postal_code = '0900987'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空の場合購入不可' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空の場合購入不可' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'phone_numberが空の場合購入不可' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上の場合購入不可' do
        @purchase.phone_number = '090234234321'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが数字以外の場合購入不可' do
        @purchase.phone_number = 'あいうえお'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
