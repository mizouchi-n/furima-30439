class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

    zenkaku = {with: /\A[ぁ-んァ-ン一-龥]/ } 
    katakana =  {with: /\A[ァ-ヶー－]+\z/ }
   
         
  with_options presence: true do
    validates :nickname
    validates :las_name,format: zenkaku
    validates :fir_name, format: zenkaku
    validates :las_name_r, format: katakana
    validates :fir_name_r,format: katakana
  end
end

