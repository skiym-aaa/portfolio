require 'rails_helper'

RSpec.describe 'PlacePhotos', type: :system do
  let(:user) { create(:user) }
  let!(:place) { create(:place, user_id: user.id) }
  let!(:place_photo) { create(:place_photo, user_id: user.id, place_id: place.id) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe '場所写真のテスト' do
    describe '場所写真詳細ページ' do
      context '表示の確認' do
        before do
          visit place_place_photo_path(place_id: place.id, id: place_photo.id)
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end

    describe '場所写真新規投稿ページ' do
      context '表示の確認' do
        before do
          visit new_place_place_photo_path(place)
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end

    describe 'タイムラインページ', type: :feature, js: true do
      context 'JS動作の確認' do
        before  do
          visit user_timeline_path(user)
        end
        it '投稿を削除できる' do
          click_on '場所写真'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept

          expect(page).to have_content '投稿を削除しました！'
        end
      end
    end

  end
end
