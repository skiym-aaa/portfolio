class Idol < ApplicationRecord
  has_many :events
  has_many :favorites

  validates :name, presence: true, uniqueness: true, length: {maximum: 30}
end
