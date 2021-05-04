require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it 'imageとnameとdescriptionとpriceとcategory_idとcondition_idとshipping_charge_idとprefecture_idとship_to_dayが存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
      end
      it 'priceが半角英数字では出品できない' do
        @product.price = "abc123"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角英字のみでは出品できない' do
        @product.price = "abcd"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが半角数字出ないと出品できない' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが¥300以下だと出品できない' do
        @product.price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9999999以上だと出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'category_idが0だと出品できない' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 0")
      end
      it 'condition_idが0だと出品できない' do
        @product.condition_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition must be other than 0")
      end
      it 'shipping_charge_idが0だと出品できない' do
        @product.shipping_charge_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge must be other than 0")
      end
      it 'prefecture_idが0だと出品できない' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'ship_to_day_idが0だと出品できない' do
        @product.ship_to_day_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Ship to day must be other than 0")
      end
    end
  end
end
