FactoryBot.define do
  factory :orders_form do
    postal_code { '123-4567' }
    prefecture_id { 13 }
    city { 'Sample City' }
    street { '123 Sample Street' }
    building_name { 'Sample Building' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end