class Idol < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  has_many :events
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :name, presence: true, uniqueness: true, length: {maximum: 30}
end
