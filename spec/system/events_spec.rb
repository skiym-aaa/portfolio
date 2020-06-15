require 'rails_helper'

RSpec.describe 'Events', type: :system do
  let(:user) { create(:user) }
  let(:idol) { create(:idol, user_id: user.id) }
  let(:place) { create(:place, user_id: user.id) }
  let!(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'イベントのテスト' do
    describe 'イベント一覧ページ' do
      context '表示の確認' do
        before do
          visit events_path
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end

    describe 'イベント詳細ページ' do
      context '表示の確認' do
        before do
          visit event_path(event)
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
      context 'JS動作の確認', type: :feature, js: true do
        before do
          visit event_path(event)
        end
        it 'イベント登録ができる' do
          click_on '登録'

          expect(page).to have_content '解除'
        end
        it 'イベント解除ができる' do
          click_on '登録'
          click_on '解除'

          expect(page).to have_content '登録'
        end
        it 'コメントができる' do
          fill_in 'event_comment[body]', with: Faker::Lorem.characters(number: 50)
          click_button '送信する'
          sleep 3

          expect(page).to have_content 'コメントを作成しました！'
        end
        it 'コメントが削除できる' do
          fill_in 'event_comment[body]', with: Faker::Lorem.characters(number: 50)
          click_button '送信する'
          click_on '削除'
          page.driver.browser.switch_to.alert.accept

          expect(page).to have_content 'コメントを削除しました！'
        end
      end
    end

    describe 'イベント新規作成ページ' do
      context '表示の確認', type: :feature, js: true do
        before do
          visit new_event_path
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
        it '新規作成に成功する' do
        select idol.name, from: 'event[idol_id]'
        select place.name, from: 'event[place_id]'
        fill_in 'event[open_date]', with: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
        fill_in 'event[start_date]', with: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
        fill_in 'event[end_date]', with: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
        # カレンダーが邪魔になり新規登録ボタンを隠してしまうため、最後にタイトルを入力
        fill_in 'event[title]', with: Faker::Lorem.characters(number: 10)

        click_button '新規登録'

        expect(page).to have_content '完了'
        end
        it '新規作成に失敗する' do
          click_button '新規登録'

          expect(page).to have_content 'ERROR'
        end
      end
    end

    describe 'イベント編集ページ' do
      context '表示の確認' do
        describe 'サイドバーのテスト' do
          before do
            visit edit_event_path(event)
          end
          it 'カレンダーが表示される' do
            expect(page).to have_selector '#calendar'
          end
          it '編集に成功する' do
          click_button '編集'

          expect(current_path).to eq('/events/' + event.id.to_s)
          end
          it '編集に失敗する' do
            fill_in 'event[title]', with: ''
            click_button '編集'

            expect(page).to have_content 'ERROR'
          end
        end
      end
    end

  end
end
