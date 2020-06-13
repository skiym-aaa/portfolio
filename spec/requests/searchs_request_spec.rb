require 'rails_helper'

RSpec.describe 'Searchs', type: :request do

  describe '検索画面のテスト' do
    context "検索結果画面への偏移" do
      before do
        visit root_path
        click_on '検索'
      end
      it '偏移できる' do
        expect(current_path).to eq(search_path)
      end
    end
  end

end