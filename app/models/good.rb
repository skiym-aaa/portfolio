class Good < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :event_photo
end
