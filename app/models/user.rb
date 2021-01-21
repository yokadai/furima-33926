class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,        format:{with:/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  validates :nickname,        presence: true
  validates :last_name,       presence: true, format:{with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :first_name,      presence: true, format:{with:/\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/}
  validates :last_name_kana,  presence: true, format:{with:/\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, presence: true, format:{with:/\A[ァ-ヶー－]+\z/}
  validates :birthday,        presence: true
end
