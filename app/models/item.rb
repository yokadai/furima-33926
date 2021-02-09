class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :description
    validates :prefecture_id
    validates :state_id
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: {
      greater_than_or_equal_to: 300,
      less_than: 10_000_000
    }
    validates :shipping_fee_id
    validates :shipping_day_id
    validates :category_id
    validates :user
    validates :image
  end

  has_one_attached       :image

  belongs_to             :user
  has_one                :destination
  has_one                :user_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :category
  belongs_to_active_hash :shippingDay
  belongs_to_active_hash :state
  belongs_to_active_hash :ShippingFee
end
