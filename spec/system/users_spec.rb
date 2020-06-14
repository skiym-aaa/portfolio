require 'rails_helper'

RSpec.describe 'Users', type: :system do

  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      before do
        visit new_user_registration_path
      end
      context '新規登録画面に遷移' do
        it '新規登録に成功する' do
          fill_in 'user[name]', with: Faker::Internet.username(specifier: 5)
          fill_in 'user[email]', with: Faker::Internet.email
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button 'サインアップ'

          expect(current_path).to eq(root_path)
        end
        it '新規登録に失敗する' do
          fill_in 'user[name]', with: ''
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: ''
          fill_in 'user[password_confirmation]', with: ''
          click_button 'サインアップ'

          expect(page).to have_content 'ERROR'
        end
      end
    end
    describe 'ユーザーログイン' do
      let(:user) { create(:user) }
      before do
        visit new_user_session_path
      end
      context 'ログイン画面に遷移' do
        it 'ログインに成功する' do
          fill_in 'user[email]', with: user.email
          fill_in 'user[password]', with: user.password
          click_button 'ログイン'

          expect(current_path).to eq(root_path)
        end

        it 'ログインに失敗する' do
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: ''
          click_button 'ログイン'

          expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
        end
      end
    end
  end

end