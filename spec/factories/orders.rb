FactoryBot.define do
  factory :order do
    id{"3"}
    postalcode{"000-0000"}
    prefecture_id{43}
    municipality{"徳島市万代町"}
    address{"1-3"}
    building{"ひまわりビル"}
    phone {"09000000000"}
    created_at { '2020-10-30 10:00:00.000000' }
    updated_at { '2020-10-30 10:00:00.000000' }
  end
end
