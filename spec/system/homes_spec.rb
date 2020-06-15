require 'rails_helper'

RSpec.describe 'Homes', type: :system do

  describe 'トップページのテスト' do
    context '表示の確認' do
      before do
        visit root_path
      end
      it 'カレンダーが表示される' do
        expect(page).to have_selector '#calendar'
      end
      it '検索フォームが表示される' do
        expect(page).to have_selector '#search_content'
      end
      it 'GitHub Activitiesが表示される' do
        expect(page).to have_selector '.github'
      end
    end
  end

end
