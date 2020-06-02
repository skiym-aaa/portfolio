require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'トップページのテスト' do
    context 'トップページが正しく表示される' do
      before do
        get root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
  describe 'アバウトページのテスト' do
    context 'アバウトページが正しく表示される' do
      before do
        get about_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end
