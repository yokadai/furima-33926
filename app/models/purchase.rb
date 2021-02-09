class Purchase
 
  include ActiveModel::Model
  attr_accessor  :postal_code, :prefecture_id, :city, :lot_number, :building, :phone_number, :user_id, :item_id, :token


  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ , message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :token
    validates :prefecture_id
    with_options numericality: { only_integer: true } do
     validates :phone_number, format:{ with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/}
    end
  end

  def save
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, lot_number: lot_number, building: building, phone_number: phone_number ,item_id: item_id, user_id: user_id)
    UserItem.create(item_id: item_id, user_id: user_id)
  end
end