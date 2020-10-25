FactoryBot.define do
    factory :user do
        nickname {Faker::Name.initials(number: 2)}
        email {Faker::Internet.free_email}
        password = {"1a2b3c",Internet.password(min_length: 6)}
        password {password}
        password_confirmation {password}
        las_name {"田中"}
        fir_name {"太郎"}
        las_name_r {"タナカ"}
        fir_name_r {"タロウ"}
        birthday {Faker::Date.birthday}
    end
end

      