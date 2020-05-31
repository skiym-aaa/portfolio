require 'rails_helper'

RSpec.describe 'EventPhotos', type: :system do
  let(:user) { create(:user) }
  let!(:idol) { create(:idol, user_id: user.id) }
  let!(:place) { create(:place, user_id: user.id) }
  let!(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }
  let!(:event_photo) { create(:event_photo, user_id: user.id, event_id: event.id) }

  before do
    visit new_user_session_path
    fill_in name="user[email]", with: user.email
    fill_in name="user[password]", with: user.password
    click_button 'ログイン'
  end

  describe 'イベント写真詳細ページ' do
    describe 'サイドバーのテスト' do
      context '表示の確認' do
        before do
          visit event_event_photo_path(event_id: event.id, id: event_photo.id)
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end
  end
  describe 'イベント写真新規投稿ページ' do
    describe 'サイドバーのテスト' do
      context '表示の確認' do
        before do
          visit new_event_event_photo_path(event)
        end
        it 'カレンダーが表示される' do
            expect(page).to have_selector '#calendar'
        end
      end
    end
  end
end