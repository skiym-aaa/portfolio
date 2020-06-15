require 'rails_helper'

RSpec.describe 'Users', type: :system do

  describe 'ユーザーのテスト' do
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

  describe 'ユーザーのアクションテスト'  do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end
    context 'ユーザー編集のテスト' do
      before  do
        visit edit_user_path(user)
      end

      it '編集に成功する' do
        click_on '編集内容を保存する'
        expect(current_path).to eq('/users/' + user.id.to_s)
      end
      it '編集に失敗する' do
        fill_in 'user[name]', with: ''
        click_on '編集内容を保存する'

        expect(page).to have_content 'ERROR'
      end
    end
    context 'ユーザー退会のテスト' do
      before  do
        visit user_confirm_path
      end
      it '退会に成功する' do
        click_on '退会する'

        expect(current_path).to eq(root_path)
      end
      it '退会したユーザーはログインできない' do
        click_on '退会する'
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'

        expect(page).to have_content '退会済みです。'
      end
    end

  end

end