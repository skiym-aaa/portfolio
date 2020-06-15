require 'rails_helper'

RSpec.describe 'Idols', type: :system do
  let(:user) { create(:user) }
  let!(:idol) { create(:idol, user_id: user.id) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
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
      context 'JS動作の確認',type: :feature, js: true do
        before do
          visit idols_path
        end
        it 'お気に入り登録ができる' do
          click_on 'お気に入り登録'

          expect(page).to have_content 'お気に入り解除'
        end
        it 'お気に入り解除ができる' do
          click_on 'お気に入り登録'
          click_on 'お気に入り解除'

          expect(page).to have_content 'お気に入り登録'
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
      context '表示の確認',type: :feature, js: true do
        before do
          visit new_idol_path
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
        it '新規作成に成功する' do
          fill_in 'idol[name]', with: Faker::Name.name
          click_button '新規登録'

          expect(page).to have_content '完了'
        end
        it '新規作成に失敗する' do
          click_button '新規登録'

          expect(page).to have_content 'ERROR'
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
        it '編集に成功する' do
          click_button '編集'

          expect(current_path).to eq('/idols/' + idol.id.to_s)
        end
        it '編集に失敗する' do
          fill_in 'idol[name]', with: ''
          click_button '編集'

          expect(page).to have_content 'ERROR'
        end
      end
    end

  end
end
