class Chat < ApplicationRecord
  # データベースにメッセージが保存されたらジョブを登録する
  after_create_commit { ChatBroadcastJob.perform_later self }
end
