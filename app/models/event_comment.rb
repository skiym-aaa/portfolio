class EventComment < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user_id, presence: true
  validates :event_id, presence: true
  validates :body, presence: true, length: { maximum: 140 }

  default_scope -> { order(created_at: :desc) }
end
