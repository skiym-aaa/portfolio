class Event < ApplicationRecord
  belongs_to :user
  belongs_to :idol
  belongs_to :place
  has_many :event_photos, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :event_registers, dependent: :destroy

  enum genre: { リリースイベント: 0, 単独ライブ: 1, 対バン: 2, 特典会: 3, 生誕祭: 4, 公開収録: 5, 舞台: 6, 配信: 7, その他: 8 }

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, format: /\A#{URI::regexp(%w(http https))}\z/, allow_blank: true
  validates :open_date, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  # default_scope -> { order(start_date: :desc) }

  def event_registered_by?(user)
    event_registers.where(user_id: user.id).exists?
  end
end
