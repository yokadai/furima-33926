FactoryBot.define do
  factory :item do
    item_name       {"アイテム"}
    description     {"説明"}
    category_id     {1}
    state_id        {1}
    shipping_fee_id {1}
    prefecture_id   {1}
    shipping_day_id {1}
    price           {300}
    association     :user
  
      
  

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
