class Item < ApplicationRecord
  has_one_attached :image
  
  validates :name, :description, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  
  validates :category_id, :days_to_ship_id, :item_condition_id, :prefecture_id, :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
end