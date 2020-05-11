require 'rails_helper'

RSpec.describe "Homes", type: :request do
  let(:user) { create(:user) }
  let(:idol) { create(:idol, user_id: user.id) }
  let(:place) { create(:place, user_id: user.id) }
  let(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }

  # describe 'トップページのテスト' do
    # context "トップページが正しく表示される" do
      # before do
        # get root_path
      # end
      # it 'リクエストは200 OKとなること' do
        # expect(response.status).to eq 200
      # end
    # end
  # end
  describe 'アバウトページのテスト' do
    context "アバウトページが正しく表示される" do
      before do
        get about_path
      end
      it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
      end
    end
  end
end
