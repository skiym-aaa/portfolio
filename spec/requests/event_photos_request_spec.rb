require 'rails_helper'

RSpec.describe 'EventPhotos', type: :request do
  let(:user) { create(:user) }
  let!(:idol) { create(:idol, user_id: user.id) }
  let!(:place) { create(:place, user_id: user.id) }
  let!(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }
  let!(:event_photo) { create(:event_photo, user_id: user.id, event_id: event.id) }

  describe 'イベント写真詳細ページ' do
    context 'イベント写真詳細ページが正しく表示される' do
      before do
        get event_event_photo_path(event_id: event.id, id: event_photo.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'イベント写真新規投稿ページ' do
    context '偏移できない' do
      before do
        get new_event_event_photo_path(event)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end

  # ログイン後
  before do
    visit new_user_session_path
    fill_in name = 'user[email]', with: user.email
    fill_in name = 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'イベント写真新規投稿ページ' do
    context 'イベント写真新規投稿ページが正しく表示される' do
      before do
        visit new_event_event_photo_path(event)
      end
      it 'イベント写真追加と表示される' do
        expect(page).to have_content('イベント写真追加')
      end
    end
  end
end
