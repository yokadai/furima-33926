FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { 'aaaaa1' }
    password_confirmation { 'aaaaa1' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'カナ' }
    first_name_kana { 'カナ' }
    birthday { 20_201_212 }
  end
end
