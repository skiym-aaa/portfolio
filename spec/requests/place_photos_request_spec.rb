require 'rails_helper'

RSpec.describe 'PlacePhotos', type: :request do
  let(:user) { create(:user) }
  let(:place) { create(:place, user_id: user.id) }

  describe '場所写真新規投稿ページ' do
    context '場所写真新規投稿ページが正しく表示される' do
      before do
        get new_place_place_photo_path(place)
      end
      it 'リクエストは302 OKとなること' do
        expect(response.status).to eq 302
      end
    end
  end
end
