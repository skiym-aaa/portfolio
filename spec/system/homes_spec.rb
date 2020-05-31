require 'rails_helper'

RSpec.describe 'Homes', type: :system do
  # let(:user) { create(:user) }
  # let!(:idol) { create(:idol, user_id: user.id) }
  # let!(:place) { create(:place, user_id: user.id) }
  # let!(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }

  describe 'トップページのテスト' do
    context "表示の確認" do
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
  # describe 'アバウトページのテスト' do
  #   context 'アバウトページが正しく表示される' do
  #     before do
  #       get about_path
  #     end
  #   end
  # end
end