class Order < ApplicationRecord

    yuubin = /\A\d{3}[-]\d{4}\z/
    dennwa = /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/

    with_options presence: true do
      validates  :postalcode, format: { with: yuubin }
      validates  :prefecture_id
      validates  :municipality
      validates  :address
      validates  :phone,  format: { with: dennwa }
    end

    validates  :building, presence: true

    belongs_to  :purchase, optional: true
end
