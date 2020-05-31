require 'rails_helper'

RSpec.describe 'Events', type: :system do
  let(:user) { create(:user) }
  let!(:idol) { create(:idol, user_id: user.id) }
  let!(:place) { create(:place, user_id: user.id) }
  let!(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }

  before do
    visit new_user_session_path
    fill_in name="user[email]", with: user.email
    fill_in name="user[password]", with: user.password
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
        describe 'サイドバーのテスト' do
          before do
            visit event_path(event)
          end
          it 'カレンダーが表示される' do
            expect(page).to have_selector '#calendar'
          end
        end
      end
    end
    describe 'イベント新規作成ページ' do
      context '表示の確認' do
        describe 'サイドバーのテスト' do
          before do
            visit new_event_path
          end
          it 'カレンダーが表示される' do
            expect(page).to have_selector '#calendar'
          end
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
        end
      end
    end
  end
end