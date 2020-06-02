# require 'rails_helper'

# RSpec.describe 'Messages', type: :request do
#   # let!(:message) { build(:message) }
#   describe 'お問い合わせ画面のテスト' do
#     describe 'メッセージフォームのテスト' do
#       context "メッセージフォームが正しく表示される" do
#         before do
#           visit contact_index_path
#         end
#         it 'メッセージフォームへ偏移できること' do
#           expect(page).to have_content 'メッセージフォーム'
#         end
#       end
#     end
#     describe '確認画面のテスト' do
#       context "確認画面が正しく表示される" do
#         before do
#           visit contact_index_path
#           fill_in name="message[name]", with: "name"
#           fill_in name="message[email]", with: "example@example.com"
#           fill_in name="message[content]", with: "content"
#           click_button '確認画面へ'
#         end
#         it '確認画面へ偏移できること' do
#           expect(page).to have_content 'メッセージ確認'
#         end
#       end
#     end
#     describe 'お問い合わせ完了画面のテスト' do
#       context "お問い合わせ完了画面が正しく表示される" do
#         before do
#           visit contact_index_path
#           fill_in name="message[name]", with: "name"
#           fill_in name="message[email]", with: "example@example.com"
#           fill_in name="message[content]", with: "content"
#           click_button '確認画面へ'
#           click_button '送信する'
#         end
#         it 'お問い合わせ完了画面へ偏移できること' do
#           expect(page).to have_content 'メッセージ送信完了'
#         end
#       end
#     end
#   end
# end
