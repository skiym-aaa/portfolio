require 'rails_helper'

RSpec.describe 'EventPhotos', type: :system do
  let(:user) { create(:user) }
  let!(:idol) { create(:idol, user_id: user.id) }
  let!(:place) { create(:place, user_id: user.id) }
  let!(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }
  let!(:event_photo) { create(:event_photo, user_id: user.id, event_id: event.id) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'イベント写真のテスト' do
    describe 'イベント写真詳細ページ' do
      context '表示の確認' do
        before do
          visit event_event_photo_path(event_id: event.id, id: event_photo.id)
        end
        it 'カレンダーが表示される' do
          expect(page).to have_selector '#calendar'
        end
      end
    end

    describe 'イベント写真新規投稿ページ' do
      context '表示の確認' do
        before do
          visit new_event_event_photo_path(event)
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
        it 'いいねできる' do
          find(:css, 'i.far.fa-thumbs-up').click

          expect(page).to have_content 'いいねしました！'
        end
        it 'いいねを解除できる' do
          find(:css, 'i.far.fa-thumbs-up').click
          find(:css, 'i.fas.fa-thumbs-up').click

          expect(page).to have_content 'いいねを解除しました！'
        end
        it '投稿を削除できる(イベント写真)' do
          click_on '削除'
          page.driver.browser.switch_to.alert.accept

          expect(page).to have_content '投稿を削除しました！'
        end
      end
    end

  end
end
