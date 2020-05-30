require 'rails_helper'

RSpec.describe 'PlacePhotos', type: :request do
  let(:user) { create(:user) }
  # let!(:idol) { create(:idol, user_id: user.id) }
  let!(:place) { create(:place, user_id: user.id) }
  let!(:place_photo) { create(:place_photo, user_id: user.id, place_id: place.id) }

  describe '場所写真詳細ページ' do
    context '場所写真詳細ページが正しく表示される' do
      before do
        get place_place_photo_path(place_id: place.id, id: place_photo.id)
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'カレンダーが表示される' do
        expect(page).to have_selector '#calendar'
      end
    end
  end

  describe '場所写真新規投稿ページ' do
    context '偏移できない' do
      before do
        get new_place_place_photo_path(place)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end

  before do
    visit new_user_session_path
    fill_in name="user[email]", with: user.email
    fill_in name="user[password]", with: user.password
    click_button 'ログイン'
  end

  describe '場所写真新規投稿ページ' do
    context '場所写真新規投稿ページが正しく表示される' do
      before do
        visit new_place_place_photo_path(place)
      end
      it '場所写真追加と表示される' do
        expect(page).to have_content('場所写真追加')
      end
      it 'カレンダーが表示される' do
        expect(page).to have_selector '#calendar'
      end
    end
  end
end
