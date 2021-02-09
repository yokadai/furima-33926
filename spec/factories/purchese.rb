FactoryBot.define do
  factory :purchase do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '000-0000' }
    prefecture_id { 3 }
    city          { '盛岡' }
    lot_number    { '3-2-2' }
    building      { 'ハイツ' }
    phone_number  { '09028194789' }
    user_id       {1}
    item_id       {1}
  end
end
