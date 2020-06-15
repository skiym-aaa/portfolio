require 'rails_helper'

RSpec.describe 'Places', type: :system do
  let(:user) { create(:user) }
  let!(:place) { create(:place, user_id: user.id) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
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
      context 'JS動作の確認', type: :feature, js: true do
        before do
          visit places_path
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

    describe '場所詳細ページ' do
      context '表示の確認' do
        before do
          visit place_path(place)
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
      context 'JS動作の確認', type: :feature, js: true do
        before do
          visit place_path(place)
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
        it 'コメントができる' do
          fill_in 'place_comment[body]', with: Faker::Lorem.characters(number: 50)
          click_button '送信する'
          # TODO: たまにパスしない
          sleep 3

          expect(page).to have_content 'コメントを作成しました！'
        end
        it 'コメントが削除できる' do
          fill_in 'place_comment[body]', with: Faker::Lorem.characters(number: 50)
          click_button '送信する'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept

          expect(page).to have_content 'コメントを削除しました！'
        end
      end
    end

    describe '場所新規作成ページ' do
      context '表示の確認', type: :feature, js: true do
        before do
          visit new_place_path
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
        it '新規作成に成功する' do
          fill_in 'place[name]', with: "ラゾーナ川崎プラザ"
          fill_in 'place[address]', with: Faker::Address.full_address
          click_button '新規登録'

          expect(page).to have_content '完了'
        end
        it '新規作成に失敗する' do
          click_button '新規登録'

          expect(page).to have_content 'ERROR'
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
        it '編集に成功する' do
          click_button '編集'

          expect(current_path).to eq('/places/' + place.id.to_s)
        end
        it '編集に失敗する' do
          fill_in 'place[name]', with: ''
          fill_in 'place[address]', with: ''
          click_button '編集'

          expect(page).to have_content 'ERROR'
        end
      end
    end

  end
end
