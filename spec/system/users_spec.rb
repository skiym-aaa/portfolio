require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }

  before do
    visit new_user_session_path
    fill_in name="user[email]", with: user.email
    fill_in name="user[password]", with: user.password
    click_button 'ログイン'
  end

  describe 'ユーザー詳細ページ' do
    context 'ユーザー詳細ページが正しく表示される' do
      before do
        visit user_path(user)
      end
      it 'カレンダーが表示される' do
        expect(page).to have_selector '#calendar'
      end
    end
  end
end