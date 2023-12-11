require 'rails_helper'

RSpec.describe OrdersForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @orders_form = FactoryBot.build(:orders_form, user_id: user.id, item_id: item.id)
  end

  describe '購入' do
    context '正常系' do
      it '正しい情報で登録できること' do
        expect(@orders_form).to be_valid
      end
    end

    context '異常系' do
      it 'user_idが必須であること' do
        @orders_form.user_id = nil
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが必須であること' do
        @orders_form.item_id = nil
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("Item can't be blank")
      end

      it '建物名が空でも登録できること' do
        @orders_form.building_name = nil
        expect(@orders_form).to be_valid
      end

      it '郵便番号が必須であること' do
        @orders_form.postal_code = nil
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号は「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @orders_form.postal_code = '1234567'
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が必須であること' do
        @orders_form.prefecture_id = 1
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が必須であること' do
        @orders_form.city = nil
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が必須であること' do
        @orders_form.street = nil
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が必須であること' do
        @orders_form.phone_number = nil
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では購入できないこと' do
        @orders_form.phone_number = '123456789'
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が12桁以上では購入できないこと' do
        @orders_form.phone_number = '123456789012'
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @orders_form.token = nil
        @orders_form.valid?
        expect(@orders_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end