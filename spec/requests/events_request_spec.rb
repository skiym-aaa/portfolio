require 'rails_helper'

RSpec.describe 'Events', type: :request do
  let(:user) { create(:user) }
  let(:idol) { create(:idol, user_id: user.id) }
  let(:place) { create(:place, user_id: user.id) }
  let(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }

  describe 'イベントのテスト' do
    describe 'イベント一覧ページ' do
      context 'イベント一覧ページが正しく表示される' do
        before do
          get events_path
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end
    describe 'イベント新規作成ページ' do
      context 'イベント新規作成ページが正しく表示される' do
        before do
          get new_event_path
        end
        it 'リクエストは302 OKとなること' do
          expect(response.status).to eq 302
        end
      end
    end
    describe 'イベント詳細ページ' do
      context 'イベント詳細ページが正しく表示される' do
        before do
          get event_path(event)
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end
    describe 'イベント編集ページ' do
      context 'イベント編集ページが正しく表示される' do
        before do
          get edit_event_path(event)
        end
        it 'リクエストは302 OKとなること' do
          expect(response.status).to eq 302
        end
      end
    end
  end
end