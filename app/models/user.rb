class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_many :comments

  zenkaku = { with: /\A[ぁ-んァ-ン一-龥]/ }
  katakana = { with: /\A[ァ-ヶー－]+\z/ }
  eisuuji = { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  with_options presence: true do
    validates :nickname
    validates :password, format: eisuuji
    validates :las_name, format: zenkaku
    validates :fir_name, format: zenkaku
    validates :las_name_r, format: katakana
    validates :fir_name_r, format: katakana
    validates :birthday
  end
end
