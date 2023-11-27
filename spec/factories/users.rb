FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example.com' }
    password              { 'password123' }
    password_confirmation { password }
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    birthday              { Date.new(2000, 1, 1) }

    trait :invalid_kana do
      last_name_kana { 'tanaka' }
      first_name_kana { 'taro' }
    end

    trait :invalid_japanese do
      last_name { 'Tanaka' }
      first_name { 'Taro' }
    end

    trait :invalid_password do
      password { 'password' }
    end

    factory :user_with_invalid_kana, traits: [:invalid_kana]
    factory :user_with_invalid_japanese, traits: [:invalid_japanese]
    factory :user_with_invalid_password, traits: [:invalid_password]
  end
end