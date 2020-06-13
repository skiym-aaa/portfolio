require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'トップ画面のテスト' do
    context 'トップ画面への偏移' do
      before do
        get root_path
      end
      it '偏移できる' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'アバウト画面のテスト' do
    context 'アバウト画面への偏移' do
      before do
        get about_path
      end
      it '偏移できる' do
        expect(response.status).to eq 200
      end
    end
  end

end
