class EventPhoto < ApplicationRecord
  mount_uploader :image_id, ImagesUploader

  belongs_to :user
  belongs_to :event
  has_many :tags, dependent: :destroy
  has_many :goods, dependent: :destroy

  validates :user_id, presence: true
  validates :event_id, presence: true
  validates :image_id, presence: true

  def gooded_by?(user)
    goods.where(user_id: user.id).exists?
  end

end
