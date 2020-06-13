require 'rails_helper'

RSpec.describe 'Messages', type: :request do

  describe 'お問い合わせ画面のテスト' do
    describe 'メッセージフォームのテスト' do
      context "メッセージフォームへの偏移" do
        before do
          visit contact_index_path
        end
        it '偏移できる' do
          expect(current_path).to eq(contact_index_path)
        end
      end
    end
    describe '確認画面のテスト' do
      context "確認画面への偏移" do
        before do
          visit contact_index_path
          fill_in "message[name]", with: "name"
          fill_in "message[email]", with: "example@example.com"
          fill_in "message[content]", with: "content"
          click_button '確認画面へ'
        end
        it '偏移できる' do
          expect(current_path).to eq(contact_confirm_path)
        end
      end
    end
    describe 'お問い合わせ完了画面のテスト' do
      context "お問い合わせ完了画面への偏移" do
        before do
          visit contact_index_path
          fill_in "message[name]", with: "name"
          fill_in "message[email]", with: "example@example.com"
          fill_in "message[content]", with: "content"
          click_button '確認画面へ'
          click_button '送信する'
        end
        it '偏移できる' do
          expect(current_path).to eq(contact_done_path)
        end
      end
    end
  end
end
