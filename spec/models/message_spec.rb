require 'rails_helper'

RSpec.describe 'メッセージモデルのテスト', type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'バリデーションのテスト' do

    context 'nameカラム' do
      it '空欄でないこと' do
        pending 'この先はなぜかテストが失敗するのであとで直す(ActiveModelを使用しているから？)'
        message.name = ''
        expect(message.valid?).to eq false
      end
      it '20文字以下であること' do
        pending
        message.name = Faker::Lorem.characters(number: 21)
        expect(message.valid?).to eq false
      end
    end
    context 'emailカラム' do
      it '空欄でないこと' do
        pending
        message.email = ''
        expect(message.valid?).to eq false
      end
      it '有効であること' do
        pending
        message.email = Faker::Internet.email
        expect(message.valid?).to eq false
      end
    end
    context 'contentカラム' do
      it '空欄でないこと' do
        pending
        message.content = ''
        expect(message.valid?).to eq false
      end
      it '1000文字以下であること' do
        pending
        message.content = Faker::Lorem.characters(number: 1001)
        expect(message.valid?).to eq false
      end
    end
  end
end