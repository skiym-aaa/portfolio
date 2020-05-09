class User < ApplicationRecord
  mount_uploader :image_id, ImagesUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :idols, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_idols, through: :favorites, source: :idol
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_places, through: :bookmarks, source: :place
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
