require 'rails_helper'

RSpec.describe 'PlaceCommentモデルのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let(:place) { create(:place, user_id: user.id) }
    let!(:place_comment) { build(:place_comment, user_id: user.id, place_id: place.id) }

    context 'bodyカラム' do
      it '空欄でないこと' do
        place_comment.body = ''
        expect(place_comment.valid?).to eq false;
      end
      it '140文字以下であること' do
        place_comment.body = Faker::Lorem.characters(number:141)
        expect(place_comment.valid?).to eq false;
      end
    end
    context 'rateカラム' do
      it '空欄でないこと' do
        place_comment.rate = ''
        expect(place_comment.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PlaceComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Placeモデルとの関係' do
      it 'N:1となっている' do
        expect(PlaceComment.reflect_on_association(:place).macro).to eq :belongs_to
      end
    end
  end
end
