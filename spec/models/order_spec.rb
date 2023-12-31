require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  describe '購入' do
    context '正常系' do
      it '正しい情報で登録できること' do
        expect(@order).to be_valid
      end
    
      it '建物名がなくても保存できること' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '異常系' do
      it '郵便番号が必須であること' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号は「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が必須であること' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @order.street = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が必須であること' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では購入できないこと' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が12桁以上では購入できないこと' do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@orders.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が英数混合では登録できないこと' do
        @order.phone_number = '090abc1234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが必須であること' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが必須であること' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
