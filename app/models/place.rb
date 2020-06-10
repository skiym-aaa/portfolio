class Place < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  belongs_to :user
  has_many :place_photos, dependent: :destroy
  has_many :place_comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :about, length: { maximum: 140 }

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
