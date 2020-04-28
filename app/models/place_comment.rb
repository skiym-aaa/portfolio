class PlaceComment < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :user_id, presence: true
  validates :place_id, presence: true
  validates :body, presence: true, length: { maximum: 140 }
  validates :rate, presence: true
end
