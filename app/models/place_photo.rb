class PlacePhoto < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  belongs_to :user
  belongs_to :place

  validates :user_id, presence: true
  validates :place_id, presence: true
  validates :image_id, presence: true
end
