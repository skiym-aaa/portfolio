require 'rails_helper'

RSpec.describe '場所モデルのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:place) { build(:place, user_id: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        place.name = ''
        expect(place.valid?).to eq false
      end
      it '30文字以下であること' do
        place.name = Faker::Lorem.characters(number: 31)
        expect(place.valid?).to eq false
      end
    end
    context 'addressカラム' do
      it '空欄でないこと' do
        place.address = ''
        expect(place.valid?).to eq false
      end
      it '50文字以下であること' do
        place.address = Faker::Lorem.characters(number: 51)
        expect(place.valid?).to eq false
      end
    end
    context 'aboutカラム' do
      it '140文字以下であること' do
        place.about = Faker::Lorem.characters(number: 141)
        expect(place.valid?).to eq false
      end
    end
    context 'official_siteカラム' do
      it 'URLであること' do
        place.official_site = Faker::Internet.url
        expect(place.valid?).to eq true
      end
    end
  end
  describe 'アソシエーションのテスト' do

    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Place.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'PlacePhotoモデルとの関係' do
      it '1:Nとなっている' do
        expect(Place.reflect_on_association(:place_photos).macro).to eq :has_many
      end
    end
    context 'PlaceCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Place.reflect_on_association(:place_comments).macro).to eq :has_many
      end
      # dependent: :destroyのテスト
      it 'Placeを削除すると、Placeに紐付くPlaceCommentも削除されること' do
        user = create(:user)
        place = create(:place, user_id: user.id)
        place_comment = create(:place_comment, user_id: user.id, place_id: place.id)
        expect{ place.destroy }.to change{ PlaceComment.count }.by(-1)
      end
    end
    context 'Eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(Place.reflect_on_association(:events).macro).to eq :has_many
      end
    end
    context 'Bookmarkモデルとの関係' do
      it '1:Nとなっている' do
        expect(Place.reflect_on_association(:bookmarks).macro).to eq :has_many
      end
    end
  end
end
