class EventComment < ApplicationRecord
  belongs_to :events

  validates :body, presence: true, length: {maximum: 140}
  validates :rate, presence: true
end
