class Place < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  has_many :photo_places
  has_many :events
  has_many :bookmarks

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  validates :name, presence: true, uniqueness: true, length: {maximum: 30}
  validates :address, presence: true, length: {maximum: 50}
end
