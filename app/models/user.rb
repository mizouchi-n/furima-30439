class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :las_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :fir_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :las_name_r, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :fir_name_r, presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
