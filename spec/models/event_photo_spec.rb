require 'rails_helper'

RSpec.describe 'イベント写真モデルのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(EventPhoto.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Eventモデルとの関係' do
      it 'N:1となっている' do
        expect(EventPhoto.reflect_on_association(:event).macro).to eq :belongs_to
      end
    end
    context 'Tagモデルとの関係' do
      it '1:Nとなっている' do
        expect(EventPhoto.reflect_on_association(:tags).macro).to eq :has_many
      end
    end
  end
end