require 'rails_helper'

RSpec.describe 'Chats', type: :request do
  let!(:user) { create(:user) }
  let!(:room) { create(:room) }

  before do
    visit new_user_session_path
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: user.password
    click_button 'ログイン'
  end

  describe 'チャットルームのテスト' do
    context "チャットルーム一覧画面への偏移" do
      before do
        visit rooms_path
      end
      it '偏移できる' do
        expect(current_path).to eq(rooms_path)
      end
      # システムスペックへ移行
      # it '作成したチャットルームが表示される' do
      #   click_link '新規チャットルーム作成'
      #   expect(page).to have_content 'Room'
      # end
    end
    context "チャットルーム詳細画面への偏移" do
      before do
        visit room_path(room.id)
      end
      it '偏移できる' do
        expect(current_path).to eq(room_path(room.id))
      end
      # システムスペックへ移行
      # before do
      #   visit rooms_path
      #   click_link '新規チャットルーム作成'
      #   click_link 'Room1'
      # end
      # it '偏移できる' do
      #   expect(current_path).to eq('/rooms/1')
      # end
      # it 'メッセージの投稿に成功する' do
      #   fill_in "chat-message", with: "test"
      #   find("#chat-message").native.send_keys(:return)
      #   expect(page).to have_content 'test'
      # end
    end
  end

end
