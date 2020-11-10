class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
  validates :first_name
  validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナを使用してください" } do
  validates :first_name_kana 
  validates :last_name_kana
  validates :birthday
  validates :nickname
  end
  validates :password, length: { minimum: 6 }, format: { with: /\A[a-z0-9]+\z/i, message: "英数字文字6以上"}

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    has_many :purchase_records
    has_many :items
       
end
