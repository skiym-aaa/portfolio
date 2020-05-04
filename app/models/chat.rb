class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :content, presence: true
  scope :recent, -> { order(created_at: :desc) }
  # データベースにメッセージが保存されたらジョブを登録する
  after_create_commit { ChatBroadcastJob.perform_later self }
end
