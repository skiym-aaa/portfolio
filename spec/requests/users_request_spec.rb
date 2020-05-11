require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe 'ユーザー認証のテスト' do
    describe 'ログインページ' do
      context "ログインページが正しく表示される" do
        before do
          get new_user_session_path
        end
        it 'リクエストは200 OKとなること' do
            expect(response.status).to eq 200
        end
      end
    end
    describe '新規会員登録ページ' do
      context "新規会員登録ページが正しく表示される" do
        before do
          get new_user_registration_path
        end
        it 'リクエストは200 OKとなること' do
            expect(response.status).to eq 200
        end
      end
    end
    describe 'パスワード変更ページ' do
      context "パスワード変更ページが正しく表示される" do
        before do
          get new_user_password_path
        end
        it 'リクエストは200 OKとなること' do
            expect(response.status).to eq 200
        end
      end
    end
  end
end
