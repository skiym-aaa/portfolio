class EventPhoto < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  belongs_to :user
  belongs_to :event
  has_many :tags, dependent: :destroy

  validates :user_id, presence: true
  validates :event_id, presence: true
  validates :image_id, presence: true
end
