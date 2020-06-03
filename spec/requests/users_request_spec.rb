require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }

  describe 'ユーザー関連画面リクエストテスト' do
    describe 'ログインページ' do
      context 'ログインページが正しく表示される' do
        before do
          get new_user_session_path
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end
    describe '新規会員登録ページ' do
      context '新規会員登録ページが正しく表示される' do
        before do
          get new_user_registration_path
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end
    describe 'パスワード変更ページ' do
      context 'パスワード変更ページが正しく表示される' do
        before do
          get new_user_password_path
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
      end
    end
    # describe 'ユーザー編集ページ' do
    #   context '偏移できない' do
    #     before do
    #       get edit_user_path(user)
    #     end
    #     it 'リクエストは302 OKとなること' do
    #       expect(response.status).to eq 302
    #     end
    #   end
    # end
    # describe 'タイムラインページ' do
    #   context '偏移できない' do
    #     before do
    #       get user_timeline_path(user)
    #     end
    #     it 'リクエストは302 OKとなること' do
    #       expect(response.status).to eq 302
    #     end
    #   end
    # end

    # ログイン後
    before do
      visit new_user_session_path
      fill_in name = 'user[email]', with: user.email
      fill_in name = 'user[password]', with: user.password
      click_button 'ログイン'
    end

    describe 'ユーザー詳細ページ' do
      context 'ユーザー詳細ページが正しく表示される' do
        before do
          visit user_path(user)
        end
        it 'ユーザー詳細と表示される' do
          expect(page).to have_content('マイページ')
        end
      end
    end

    describe 'ユーザー編集ページ' do
      context 'ユーザー編集ページが正しく表示される' do
        before do
          visit edit_user_path(user)
        end
        it 'ユーザー編集と表示される' do
          expect(page).to have_content('マイページ(登録情報変更)')
        end
      end
    end

    describe 'タイムラインページ' do
      context 'タイムラインページが正しく表示される' do
        before do
          visit user_timeline_path(user)
        end
        it 'タイムラインと表示される' do
          expect(page).to have_content('タイムライン')
        end
      end
    end
  end
end
