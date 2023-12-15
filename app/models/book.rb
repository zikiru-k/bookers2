class Book < ApplicationRecord
  # アソシエーション組むと勝手にバリデーションでるよ
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
