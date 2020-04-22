class PlacePhoto < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  belongs_to :place
end
