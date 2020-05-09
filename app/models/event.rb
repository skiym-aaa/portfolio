class Event < ApplicationRecord
  belongs_to :user
  belongs_to :idol
  belongs_to :place
  has_many :event_comments, dependent: :destroy
  has_many :event_registers, dependent: :destroy

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 50 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  def event_registered_by?(user)
    event_registers.where(user_id: user.id).exists?
  end
end
