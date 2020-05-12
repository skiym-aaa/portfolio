require 'rails_helper'

RSpec.describe 'Places', type: :request do
  let(:user) { create(:user) }
  let(:place) { create(:place, user_id: user.id) }

  describe '場所のテスト' do
    describe '場所一覧ページ' do
      context '場所一覧ページが正しく表示される' do
        before do
          get places_path
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end
    describe '場所新規作成ページ' do
      context '場所新規作成ページが正しく表示される' do
        before do
          get new_place_path
        end
        it 'リクエストは302 OKとなること' do
          expect(response.status).to eq 302
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
      end
    end
    describe '場所編集ページ' do
      context '場所編集ページが正しく表示される' do
        before do
          get edit_place_path(place)
        end
        it 'リクエストは302 OKとなること' do
          expect(response.status).to eq 302
        end
      end
    end
  end
end
