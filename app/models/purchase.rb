class Purchase
 
  include ActiveModel::Model
  attr_accessor  :postal_code, :card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture_id, :city, :lot_number, :building, :phone_number, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :lot_number
    with_options numericality: { only_integer: true } do
      validates :card_number
      validates :card_exp_month
      validates :card_exp_year
      validates :phone_number
    end
  end

  def save
    user = User.find(params[:id])
    Donation.create(postal_code: postal_code, prefecture: prefecture_id, city: city, lot_number: lot_number, building: building, phone_number: phone_number, user_id: user.id)
  end
end