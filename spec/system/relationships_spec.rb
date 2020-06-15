require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
  let(:user) { create(:user) }
  let(:test_user2) { create(:user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'フォローのテスト' do
    context '他人のマイページ', type: :feature, js: true do
      before  do
        visit user_path(test_user2)
      end
      it '他のユーザーをフォローできる' do
        click_on 'フォローする'

        expect(page).to have_content 'フォローしました！'
      end
      it 'フォローを解除できる' do
        click_on 'フォローする'
        click_on 'フォロー外す'

        expect(page).to have_content 'フォローを解除しました！'
      end
    end
  end

end