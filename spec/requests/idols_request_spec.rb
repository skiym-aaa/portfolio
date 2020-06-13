require 'rails_helper'

RSpec.describe 'idols', type: :request do
  let(:user) { create(:user) }
  let!(:idol) { create(:idol, user_id: user.id) }

  describe 'アイドル画面リクエストテスト' do
    describe 'アイドル一覧画面のテスト' do
      context 'アイドル一覧画面への偏移' do
        before do
          get idols_path
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
    end

    describe 'アイドル詳細画面のテスト' do
      context 'アイドル詳細画面への偏移' do
        before do
          get idol_path(idol)
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
    end

    describe 'アイドル新規登録画面のテスト' do
      context 'アイドル新規登録画面への偏移' do
        before do
          get new_idol_path
        end
        it '偏移できない' do
          expect(response.status).to eq 302
        end
      end
    end

    describe 'アイドル編集画面のテスト' do
      context 'アイドル編集画面への偏移' do
        before do
          get edit_idol_path(idol)
        end
        it '偏移できない' do
          expect(response.status).to eq 302
        end
      end
    end

    # ログイン後
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    describe 'アイドル新規登録画面のテスト' do
      context 'アイドル新規登録画面への偏移' do
        before do
          visit new_idol_path
        end
        it '偏移できる' do
          expect(current_path).to eq(new_idol_path)
        end
      end
    end

    describe 'アイドル編集画面のテスト' do
      context 'アイドル編集画面への偏移' do
        before do
          visit edit_idol_path(idol)
        end
        it '偏移できる' do
          expect(current_path).to eq('/idols/' + idol.id.to_s + '/edit')
        end
      end
    end
  end

end
