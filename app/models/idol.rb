class Idol < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  belongs_to :user
  has_many :events
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true, length: {maximum: 30}
end
