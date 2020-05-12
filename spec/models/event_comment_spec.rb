require 'rails_helper'

RSpec.describe 'EventCommentモデルのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let(:idol) { create(:idol, user_id: user.id) }
    let(:place) { create(:place, user_id: user.id) }
    let(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }
    let!(:event_comment) { build(:event_comment, user_id: user.id, event_id: event.id) }

    context 'bodyカラム' do
      it '空欄でないこと' do
        event_comment.body = ''
        expect(event_comment.valid?).to eq false
      end
      it '140文字以下であること' do
        event_comment.body = Faker::Lorem.characters(number: 141)
        expect(event_comment.valid?).to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(EventComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Eventモデルとの関係' do
      it 'N:1となっている' do
        expect(EventComment.reflect_on_association(:event).macro).to eq :belongs_to
      end
    end
  end
end
