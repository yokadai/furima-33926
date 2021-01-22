class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :description
    validates :prefecture_id
    validates :state_id
    validates :price,          format: {with: /\A[0-9]+\z/}, :numericality => { :greater_than => 299 }, :numericality => { :less_than => 10000000} 
    validates :shopping_fee_id
    validates :shopping_day_id
    validates :category_id
    validates :user
  end
end