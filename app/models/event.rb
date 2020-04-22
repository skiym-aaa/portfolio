class Event < ApplicationRecord
  #belongs_to :idol
  #belongs_to :place
  has_many :event_comments

  validates :title, presence: true, length: {maximum: 30}
  validates :body, presence: true, length: {maximum: 50}
end