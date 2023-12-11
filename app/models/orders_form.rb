class OrdersForm
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city, :street, :building_name, :phone_number, :token

  validates :token, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid" }
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "is invalid" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Information.create(
      order_id: order.id,
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      street: street,
      building_name: building_name,
      phone_number: phone_number
    )
  end

end