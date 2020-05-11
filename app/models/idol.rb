class Idol < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :about, length: { maximum: 140 }
end
