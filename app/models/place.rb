class Place < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  belongs_to :user
  has_many :place_photos
  has_many :place_comments
  has_many :events
  has_many :bookmarks

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true, length: {maximum: 30}
  validates :address, presence: true, length: {maximum: 50}
end
