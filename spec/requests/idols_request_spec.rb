require 'rails_helper'

RSpec.describe 'Idols', type: :request do
  let(:user) { create(:user) }
  let(:idol) { create(:idol, user_id: user.id) }

  describe 'アイドルのテスト' do
    describe 'アイドル一覧ページ' do
      context 'アイドル一覧ページが正しく表示される' do
        before do
          get idols_path
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end
    describe 'アイドル新規作成ページ' do
      context 'アイドル新規作成ページが正しく表示される' do
        before do
          get new_idol_path
        end
        it 'リクエストは302 OKとなること' do
          expect(response.status).to eq 302
        end
      end
    end
    describe 'アイドル詳細ページ' do
      context 'アイドル詳細ページが正しく表示される' do
        before do
          get idol_path(idol)
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end
    describe 'アイドル編集ページ' do
      context 'アイドル編集ページが正しく表示される' do
        before do
          get edit_idol_path(idol)
        end
        it 'リクエストは302 OKとなること' do
          expect(response.status).to eq 302
        end
      end
    end
  end
end
