require 'rails_helper'

RSpec.describe 'Places', type: :request do
  let(:user) { create(:user) }
  let!(:place) { create(:place, user_id: user.id) }

  describe '場所画面リクエストテスト' do
    describe '場所一覧画面のテスト' do
      context '場所一覧画面への偏移' do
        before do
          get places_path
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
    end

    describe '場所詳細画面のテスト' do
      context '場所詳細画面への偏移' do
        before do
          get place_path(place)
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
    end

    describe '場所新規登録画面のテスト' do
      context '場所新規登録画面への偏移' do
        before do
          get new_place_path
        end
        it '偏移できない' do
          expect(response.status).to eq 302
        end
      end
    end

    describe '場所編集画面のテスト' do
      context '場所編集画面への偏移' do
        before do
          get edit_place_path(place)
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

    describe '場所新規登録画面のテスト' do
      context '場所新規登録画面への偏移' do
        before do
          visit new_place_path
        end
        it '偏移できる' do
          expect(current_path).to eq(new_place_path)
        end
      end
    end

    describe '場所編集画面のテスト' do
      context '場所編集画面への偏移' do
        before do
          visit edit_place_path(place)
        end
        it '偏移できる' do
          expect(current_path).to eq('/places/' + place.id.to_s + '/edit')
        end
      end
    end
  end

end
