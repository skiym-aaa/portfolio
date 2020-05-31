require 'rails_helper'

RSpec.describe 'Idols', type: :system do
  let(:user) { create(:user) }
  let!(:idol) { create(:idol, user_id: user.id) }

  before do
    visit new_user_session_path
    fill_in name="user[email]", with: user.email
    fill_in name="user[password]", with: user.password
    click_button 'ログイン'
  end

  describe 'アイドルのテスト' do
    describe 'アイドル一覧ページ' do
      context '表示の確認' do
        before do
          visit idols_path
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end
    describe 'アイドル詳細ページ' do
      context '表示の確認' do
        before do
          visit idol_path(idol)
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end
    describe 'アイドル新規作成ページ' do
      context '表示の確認' do
        before do
          visit new_idol_path
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end
    describe 'アイドル編集ページ' do
      context '表示の確認' do
        before do
          visit edit_idol_path(idol)
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end
  end
end