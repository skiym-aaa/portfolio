require 'rails_helper'

RSpec.describe 'タグモデルのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'アソシエーションのテスト' do
    context 'PlacePhotoモデルとの関係' do
      it 'N:1となっている' do
        expect(Tag.reflect_on_association(:place_photo).macro).to eq :belongs_to
      end
    end
    context 'Eventphotoモデルとの関係' do
      it 'N:1となっている' do
        expect(Tag.reflect_on_association(:event_photo).macro).to eq :belongs_to
      end
    end
  end
end