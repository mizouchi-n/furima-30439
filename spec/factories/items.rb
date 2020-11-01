FactoryBot.define do
  factory :item do
    association :user

    name { 'aaa' }
    description { 'aaa' }
    category_id { '3' }
    status_id { '3' }
    burden_id { '3' }
    area_id { '3' }
    day_id { '3' }
    price { Faker::Number.between(300, 9_999_999) }
    created_at { '2020-10-30 10:00:00.000000' }
    updated_at { '2020-10-30 10:00:00.000000' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
