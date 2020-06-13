require 'rails_helper'

RSpec.describe 'ブックマークモデルのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Bookmark.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Idolモデルとの関係' do
      it 'N:1となっている' do
        expect(Bookmark.reflect_on_association(:place).macro).to eq :belongs_to
      end
    end
  end
end