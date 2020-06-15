require 'rails_helper'

RSpec.describe 'Searchs', type: :system do
  let(:user) { create(:user) }
  let(:idol) { create(:idol, user_id: user.id) }
  let(:place) { create(:place, user_id: user.id) }
  let!(:event) { create(:event, user_id: user.id, idol_id: idol.id, place_id: place.id) }

  describe '検索のテスト' do
    context "検索結果画面ページ" do
      before do
        visit root_path
        click_on '検索'
      end
      it '検索結果が表示されない' do
        expect(page).to have_content('検索ワードを入力してください。')
      end
      it '検索結果が表示される(イベント)' do
        fill_in 'search[content]', with: event.title
        select 'イベント', from: 'search[model]'
        click_on '検索'

        expect(page).to have_content(event.title)
      end
      it '検索結果が表示される(アイドル)' do
        fill_in 'search[content]', with: idol.name
        select 'アイドル', from: 'search[model]'
        click_on '検索'

        expect(page).to have_content(idol.name)
      end
      it '検索結果が表示される(場所)' do
        fill_in 'search[content]', with: place.name
        select '場所', from: 'search[model]'
        click_on '検索'

        expect(page).to have_content(place.name)
      end

    end
  end

end