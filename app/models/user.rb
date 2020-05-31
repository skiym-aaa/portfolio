class User < ApplicationRecord
  mount_uploader :image_id, ImagesUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :idols
  has_many :places
  has_many :events
  has_many :place_photos
  has_many :event_photos

  has_many :favorites, dependent: :destroy
  has_many :favorite_idols, through: :favorites, source: :idol
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_places, through: :bookmarks, source: :place
  has_many :goods, dependent: :destroy
  has_many :good_event_photos, through: :goods, source: :event_photo

  has_many :place_comments, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :event_registers, dependent: :destroy
  has_many :event_event_registers, through: :event_registers, source: :event, dependent: :destroy

  validates :name, length: { maximum: 20, minimum: 2 }

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
