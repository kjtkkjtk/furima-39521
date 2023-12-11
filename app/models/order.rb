class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :information

  # validates_associated :item, :user, :information
end