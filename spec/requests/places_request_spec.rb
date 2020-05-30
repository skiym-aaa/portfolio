require 'rails_helper'

RSpec.describe 'Places', type: :request do
  let(:user) { create(:user) }
  let!(:place) { create(:place, user_id: user.id) }

  describe '場所のテスト' do
    describe '場所一覧ページ' do
      context '場所一覧ページが正しく表示される' do
        before do
          get places_path
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end
    describe '場所詳細ページ' do
      context '場所詳細ページが正しく表示される' do
        before do
          get place_path(place)
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end

    describe '場所新規作成ページ' do
      context '偏移できない' do
        before do
          get new_place_path
        end
        it 'リクエストは302 OKとなること' do
          expect(response.status).to eq 302
        end
      end
    end
    describe '場所編集ページ' do
      context '偏移できない' do
        before do
          get edit_place_path(place)
        end
        it 'リクエストは302 OKとなること' do
          expect(response.status).to eq 302
        end
      end
    end

    # ログイン後
    before do
      visit new_user_session_path
      fill_in name="user[email]", with: user.email
      fill_in name="user[password]", with: user.password
      click_button 'ログイン'
    end

    describe '場所新規作成ページ' do
      context '場所新規作成ページが正しく表示される' do
        before do
          visit new_place_path
        end
        it '場所新規登録と表示される' do
          expect(page).to have_content('場所新規登録')
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end

    describe '場所編集ページ' do
      context '場所編集ページが正しく表示される' do
        before do
          visit edit_place_path(place)
        end
        it '場所編集と表示される' do
          expect(page).to have_content('場所編集')
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end
  end
end
