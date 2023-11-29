FactoryBot.define do
  factory :item do
    name { 'Sample Item' }
    description { 'This is a sample item.' }
    category_id { 2 } 
    item_condition_id { 2 } 
    shipping_fee_id { 2 } 
    prefecture_id { 13 } 
    days_to_ship_id { 2 } 
    price { 1000 }

    
  end
end