class PlaceComment < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :body, presence: true, length: {maximum: 140}
end
