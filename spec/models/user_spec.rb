require 'rails_helper'

RSpec.describe 'ユーザーモデルのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'バリデーションのテスト' do
    let(:user) { build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false
      end
      it '2文字以上であること' do
        test_user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '50文字以下であること' do
        test_user.name = Faker::Lorem.characters(number: 51)
        is_expected.to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Idolモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:idols).macro).to eq :has_many
      end
    end
    context 'Placeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:places).macro).to eq :has_many
      end
    end
    context 'Eventモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:events).macro).to eq :has_many
      end
    end
    context 'PlaceCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:place_comments).macro).to eq :has_many
      end
    end
    context 'EventCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:event_comments).macro).to eq :has_many
      end
    end
  end
end
