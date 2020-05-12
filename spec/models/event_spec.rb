require 'rails_helper'

RSpec.describe 'イベントのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let(:idol) { create(:idol, user_id: user.id) }
    let(:place) { create(:place, user_id: user.id) }
    let!(:event) { build(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        # binding.pry
        event.title = ''
        expect(event.valid?).to eq false
      end
      it '30文字以下であること' do
        event.title = Faker::Lorem.characters(number: 31)
        expect(event.valid?).to eq false
      end
    end
    context 'bodyカラム' do
      it '50文字以下であること' do
        event.body = Faker::Lorem.characters(number: 51)
        expect(event.valid?).to eq false
      end
    end
    context 'start_dateカラム' do
      it '空欄でないこと' do
        event.start_date = ''
        expect(event.valid?).to eq false
      end
    end
    context 'end_dateカラム' do
      it '空欄でないこと' do
        event.end_date = ''
        expect(event.valid?).to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Event.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'EventCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Event.reflect_on_association(:event_comments).macro).to eq :has_many
      end
    end
  end
end
