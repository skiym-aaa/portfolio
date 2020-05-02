class RoomChannel < ApplicationCable::Channel
  def subscribed
    # room_channelからデータを受信する
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # データベースにクライアントから受信したメッセージを保存する
    Chat.create! content: data['chat']
  end
end
