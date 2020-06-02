require 'rails_helper'

RSpec.describe 'Places', type: :system do
  let(:user) { create(:user) }
  let!(:place) { create(:place, user_id: user.id) }

  before do
    visit new_user_session_path
    fill_in name = 'user[email]', with: user.email
    fill_in name = 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe '場所のテスト' do
    describe '場所一覧ページ' do
      context '表示の確認' do
        before do
          visit places_path
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end
    describe '場所詳細ページ' do
      context '表示の確認' do
        before do
          visit place_path(place)
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end
    describe '場所新規作成ページ' do
      context '表示の確認' do
        before do
          visit new_place_path
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end

    describe '場所編集ページ' do
      context '表示の確認' do
        before do
          visit edit_place_path(place)
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end
  end
end
