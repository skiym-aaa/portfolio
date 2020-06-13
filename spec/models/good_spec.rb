require 'rails_helper'

RSpec.describe 'グッドモデルのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Good.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Eventモデルとの関係' do
      it 'N:1となっている' do
        expect(Good.reflect_on_association(:event).macro).to eq :belongs_to
      end
    end
    context 'EventPhotoモデルとの関係' do
      it '1:Nとなっている' do
        expect(Good.reflect_on_association(:event_photo).macro).to eq :belongs_to
      end
    end
  end
end