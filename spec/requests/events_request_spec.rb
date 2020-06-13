require 'rails_helper'

RSpec.describe 'Events', type: :request do
  let(:user) { create(:user) }
  let(:idol) { create(:idol, user_id: user.id) }
  let(:place) { create(:place, user_id: user.id) }
  let!(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }

  describe 'イベント画面リクエストテスト' do
    describe 'イベント一覧画面のテスト' do
      context 'イベント一覧画面への偏移' do
        before do
          get events_path
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
    end

    describe 'イベント詳細画面のテスト' do
      context 'イベント詳細画面への偏移' do
        before do
          get event_path(event)
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
    end

    describe 'イベント新規登録画面のテスト' do
      context 'イベント新規登録画面への偏移' do
        before do
          get new_event_path
        end
        it '偏移できない' do
          expect(response.status).to eq 302
        end
      end
    end

    describe 'イベント編集画面のテスト' do
      context 'イベント編集画面への偏移' do
        before do
          get edit_event_path(event)
        end
        it '偏移できない' do
          expect(response.status).to eq 302
        end
      end
    end

    # ログイン後
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    describe 'イベント新規登録画面のテスト' do
      context 'イベント新規登録画面への偏移' do
        before do
          visit new_event_path
        end
        it '偏移できる' do
          expect(current_path).to eq(new_event_path)
        end
      end
    end

    describe 'イベント編集画面のテスト' do
      context 'イベント編集画面への偏移' do
        before do
          visit edit_event_path(event)
        end
        it '偏移できる' do
          expect(current_path).to eq('/events/' + event.id.to_s + '/edit')
        end
      end
    end
  end

end
