require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: 'test', first_name: 'test', last_name_kana: 'test', first_name_kana: 'test', birthday: '1111')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
      # nicknameが空では登録できないテストコードを記述します
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000', last_name: 'test', first_name: 'test', last_name_kana: 'test', first_name_kana: 'test', birthday: '1111')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
      # emailが空では登録できないテストコードを記述します
    end
    it 'encrypted_passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: '', last_name: 'test', first_name: 'test', last_name_kana: 'test', first_name_kana: 'test', birthday: '1111')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
      # encrypted_passwordが空では登録できないテストコードを記述します
    end
    it 'last_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: '', first_name: 'test', last_name_kana: 'test', first_name_kana: 'test', birthday: '1111')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
      # last_nameが空では登録できないテストコードを記述します
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: 'test', first_name: '', last_name_kana: 'test', first_name_kana: 'test', birthday: '1111')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
      # first_nameが空では登録できないテストコードを記述します
    end
    it 'last_name_kanaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: 'test', first_name: 'test', last_name_kana: '', first_name_kana: 'test', birthday: '1111')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
      # last_name_kana空では登録できないテストコードを記述します
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: 'test', first_name: 'test', last_name_kana: 'test', first_name_kana: '', birthday: '1111')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
      # first_name_kanaが空では登録できないテストコードを記述します
    end
    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: '000000', last_name: 'test', first_name: 'test', last_name_kana: 'test', first_name_kana: 'test', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
      # birthday空では登録できないテストコードを記述します
    end
  end
end
