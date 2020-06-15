require 'rails_helper'

RSpec.describe 'Chats', type: :system do
  let!(:user) { create(:user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'チャットルームのテスト' do
    context 'チャットルーム一覧の表示確認' do
      before do
        visit rooms_path
      end
      it '新規チャットルーム作成ボタンが表示される' do
        expect(page).to have_content '新規チャットルーム作成'
      end
      it '作成したチャットルームが表示される' do
        click_link '新規チャットルーム作成'
        expect(page).to have_content 'Room'
      end
    end
    context 'チャットルームの表示確認', type: :feature, js: true do
      before do
        visit rooms_path
        click_link '新規チャットルーム作成'
        click_link 'Room1'
      end
      it 'チャットルームが表示される' do
        expect(page).to have_content 'Chat Room 1'
      end
      it 'メッセージの投稿に成功する' do
        fill_in "chat-message", with: "test"
        find("#chat-message").native.send_keys(:return)
        expect(page).to have_content 'test'
      end
    end

  end
end
