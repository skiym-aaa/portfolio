class Tag < ApplicationRecord
  belongs_to :place_photo, optional: true
  belongs_to :event_photo, optional: true
end
