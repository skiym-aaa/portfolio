class PlacePhoto < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  belongs_to :user
  belongs_to :place

  validates :image_id, presence: true
end
