require 'rails_helper'

RSpec.describe 'PlacePhotos', type: :request do
  let(:user) { create(:user) }
  let(:place) { create(:place, user_id: user.id) }
  let!(:place_photo) { create(:place_photo, user_id: user.id, place_id: place.id) }

  describe '場所写真画面リクエストテスト' do
    describe '場所写真詳細画面のテスト' do
      context '場所写真詳細画面への偏移' do
        before do
          get place_place_photo_path(place_id: place.id, id: place_photo.id)
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
    end

    describe '場所写真新規投稿画面のテスト' do
      context '場所写真新規投稿画面への偏移' do
        before do
          get new_place_place_photo_path(place)
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

    describe '場所写真新規投稿画面のテスト' do
      context '場所写真新規投稿画面への偏移' do
        before do
          visit new_place_place_photo_path(place)
        end
        it '偏移できる' do
          expect(current_path).to eq(new_place_place_photo_path(place.id))
        end
      end
    end
  end
end
