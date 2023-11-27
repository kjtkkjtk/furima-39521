require 'rails_helper'

RSpec.describe User, type: :model do
  include FactoryBot::Syntax::Methods

  describe 'ユーザー新規登録' do
    context '正常系' do
      before do
        @user = build(:user)
      end

      it '正しい情報で登録できること' do
        expect(@user).to be_valid
      end

      it '適切な形式のメールアドレスで登録できること' do
        @user.email = 'test@example.com'
        expect(@user).to be_valid
      end

      it '適切な形式のパスワードで登録できること' do
        @user.password = 'Password1'
        @user.password_confirmation = 'Password1'
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      before do
        @user = build(:user)
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'パスワードが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it '姓が空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名が空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '姓（フリガナ）が空では登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '名（フリガナ）が空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '誕生日が空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '名字（フリガナ）が全角カタカナでないと登録できない' do
        @user.last_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力してください")
      end

      it '名前（フリガナ）が全角カタカナでないと登録できない' do
        @user.first_name_kana = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力してください")
      end

      it '名字が全角日本語でないと登録できない' do
        @user.last_name = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角日本語で入力してください")
      end

      it '名前が全角日本語でないと登録できない' do
        @user.first_name = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角日本語で入力してください")
      end

      it 'パスワードが英数字混合でないと登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は英数字混合で入力してください")
      end
    end
  end
end