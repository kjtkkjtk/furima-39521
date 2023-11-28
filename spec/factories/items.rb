FactoryBot.define do
  factory :item do
    name { 'Sample Item' }
    description { 'This is a sample item.' }
    category_id { 2 } # 仮の値。実際のカテゴリーIDに置き換えてください。
    item_condition_id { 2 } # 仮の値。実際の商品状態IDに置き換えてください。
    shipping_fee_id { 2 } # 仮の値。実際の配送料IDに置き換えてください。
    prefecture_id { 13 } # 仮の値。実際の都道府県IDに置き換えてください。
    days_to_ship_id { 2 } # 仮の値。実際の発送までの日数IDに置き換えてください。
    price { 1000 }

    
  end
end