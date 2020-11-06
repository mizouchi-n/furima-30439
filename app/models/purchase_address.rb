class PurchaseAddress
  include ActiveModel::Model
    
  attr_accessor :postalcode,:prefecture_id,:municipality,:address,:building,:phone,:user_id,:item_id,:token

    yuubin = /\A\d{3}[-]\d{4}\z/
    dennwa = /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/

    with_options presence: true do
      validates  :postalcode, format: { with: yuubin }
      validates :prefecture_id, presence: true
      validates :municipality, presence: true
      validates :address, presence: true
      validates  :phone,  format: { with: dennwa }
      validates :token, presence: true 
    end

   

    def save
      purchase_address = Purchase.create(item_id:item_id, user_id:user_id)

      Order.create!(postalcode: postalcode,prefecture_id: prefecture_id,municipality: municipality,address: address,building: building,phone: phone)

    end
end


  