require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }
  let!(:test_user2) { create(:user) }

  describe 'ユーザー関連画面リクエストテスト' do
    # ログイン前
    describe 'ログイン画面のテスト' do
      context 'ログインページへの偏移' do
        before do
          get new_user_session_path
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
    end

    describe '新規会員登録画面のテスト' do
      context '新規登録画面への偏移' do
        before do
          get new_user_registration_path
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
    end

    describe 'パスワード変更画面のテスト' do
      context 'パスワード変更画面への偏移' do
        before do
          get new_user_password_path
        end
        it '偏移できる' do
          expect(response.status).to eq 200
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

    describe '詳細画面のテスト' do
      context '自分の詳細画面への偏移' do
        before do
          get user_path(user)
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
      context '他人の詳細画面(タイムライン)への偏移' do
        before do
          get user_path(test_user2)
        end
        it '偏移できる' do
          expect(response.status).to eq 200
        end
      end
    end

    # baria_userの関係で'get'ではなく'visit'を使用する。
    describe '編集のテスト' do
      context '自分の編集画面への遷移' do
        before do
          visit edit_user_path(user)
        end
        it '偏移できる' do
          expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
        end
      end
      context '他人の編集画面への遷移' do
        before do
          visit edit_user_path(test_user2)
        end
        it '偏移できない' do
          expect(current_path).to eq(root_path)
        end
      end
    end

    describe 'タイムラインのテスト' do
      context '自分のタイムラインへの偏移' do
        before do
          visit user_timeline_path(user)
        end
        it '偏移できる' do
          expect(current_path).to eq('/users/' + user.id.to_s + '/timeline')
        end
      end
      context '他人のタイムラインへの偏移' do
        before do
          visit user_timeline_path(test_user2)
        end
        it '偏移できない' do
          expect(current_path).to eq(root_path)
        end
      end
    end

    describe '退会のテスト' do
      context '退会画面への偏移' do
        before do
          visit user_confirm_path
        end
        it '偏移できる' do
          expect(current_path).to eq(user_confirm_path)
        end
      end
    end
  end

end
