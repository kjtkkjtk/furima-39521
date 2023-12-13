class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_one :order

  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :days_to_ship
  
  validates :image, presence: { message: "can't be blank" }
  validates :name, :description, :price, presence: true
  validates :category_id, :item_condition_id, :shipping_fee_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  
  def sold_out?
    order.present?
  end
  
end