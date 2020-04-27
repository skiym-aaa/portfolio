class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :favorite_idols, through: :favorites, source: :idol
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_places, through: :bookmarks, source: :place
end
