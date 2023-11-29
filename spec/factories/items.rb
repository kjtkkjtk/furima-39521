FactoryBot.define do
  factory :item do
    association :user, factory: :user
    name { 'Sample Item' }
    description { 'This is a sample item.' }
    category_id { 2 } 
    item_condition_id { 2 } 
    shipping_fee_id { 2 } 
    prefecture_id { 13 } 
    days_to_ship_id { 2 } 
    price { 1000 }
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
