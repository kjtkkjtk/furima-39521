class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true

  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角日本語で入力してください' }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英数字混合で入力してください' }

  validates :email, uniqueness: { case_sensitive: false, message: 'はすでに存在します' }
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'は有効なメールアドレスではありません' }
  validates :password, length: { minimum: 6, message: 'は6文字以上で入力してください' }
  validates :password, confirmation: { message: 'と確認用パスワードが一致しません' }
  validates :password, format: { without: /\A\d+\z/, message: 'は数字のみでは登録できません' }
  validates :password, format: { without: /\A[^a-zA-Z\d]+\z/, message: 'は全角では登録できません' }
  
end
