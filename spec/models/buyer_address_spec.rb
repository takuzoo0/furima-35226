require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '発送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: user.id, product_id: product.id)
      sleep 0.1
    end
    context '情報が保存できるとき' do
      it '配送先の情報とtokenが存在すれば保存できる' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end
    context '情報が保存できないとき' do
      it 'postal_codeが空では保存できない' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it 'postal_codeの中にハイフンが存在しないと保存ができない' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが空では保存できない' do
        @buyer_address.prefecture_id = 0
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'cityが空だと保存できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberは11桁の数値のみじゃないと保存ができない' do
        @buyer_address.phone_number = '1234567890'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では保存できない' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空だと保存できない' do
        @buyer_address.product_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
