class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :state_id
  belongs_to_active_hash :Shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :Shipping_days
  has_one_attached       :image

  with_options presence: true do
    validates :item_name
    validates :description
    validates :prefecture_id
    validates :state_id
    validates :price,          format: {with: /\A[0-9]+\z/}, :numericality => { :greater_than => 299 }, :numericality => { :less_than => 10000000} 
    validates :shipping_fee_id
    validates :shipping_day_id
    validates :category_id
    validates :user
  end
end