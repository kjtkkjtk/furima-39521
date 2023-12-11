FactoryBot.define do
  factory :order do
    association :item, factory: :item
    association :user, factory: :user
    # association :information, factory: :information
    postal_code { '123-4567' }
    prefecture_id { 13 }
    street { '123 Sample Street' }
    city { 'Sample City' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end