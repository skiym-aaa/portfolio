class Place < ApplicationRecord
has_many :photo_places
has_many :events
has_many :bookmarks

validates :name, presence: true, uniqueness: true, length: {maximum: 30}
validates :address, presence: true, length: {maximum: 50}
end
