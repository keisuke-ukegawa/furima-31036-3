class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name, presence: true,      format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
  validates :last_name, presence: true,       format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナを使用してください" }
  validates :last_name_kana, presence: true,  format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナを使用してください" }
  validates :birthday, presence: true
  validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: "英数字文字6以上"}

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
       
end
