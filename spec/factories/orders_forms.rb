FactoryBot.define do
  factory :orders_form do
    postal_code { '123-4567' }
    prefecture_id { 13 }
    city { 'Sample City' }
    street { '123 Sample Street' }
    phone_number { '09012345678' }
    association :order, factory: :order
    token {"tok_abcdefghijk00000000000000000"}
  end
end