$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    # Enterキーが押されたらサーバへメッセージを送信する
    if event.keyCode is 13 # return = send
        App.room.speak event.target.value
        event.target.value = ''
        event.preventDefault()

  room_id = $('#chats').data('room_id')
  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: room_id },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # メッセージ一覧の末尾に受信したメッセージを追加する
    $('#chats').append data['chat']
    console.log(data['chat'])
  speak: (chat) ->
    # サーバのspeakメソッドを呼び出す
    @perform 'speak', {chat: chat, room_id: $('#chats').data('room_id')}