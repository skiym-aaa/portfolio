require 'rails_helper'

RSpec.describe 'アイドルモデルのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:idol) { build(:idol, user_id: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        idol.name = ''
        expect(idol.valid?).to eq false
      end
      it '30文字以下であること' do
        idol.name = Faker::Lorem.characters(number: 31)
        expect(idol.valid?).to eq false
      end
    end
    context 'aboutカラム' do
      it '140文字以下であること' do
        idol.about = Faker::Lorem.characters(number: 141)
        expect(idol.valid?).to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Idol.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(Idol.reflect_on_association(:events).macro).to eq :has_many
      end
    end
  end
end
