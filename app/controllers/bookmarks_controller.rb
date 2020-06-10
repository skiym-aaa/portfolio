class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place

  # homes#topのランダム表示を切り替えるために、通常アクションと非同期通信アクションを作成
  def create
    bookmark = current_user.bookmarks.new(place_id: @place.id)
    bookmark.save
    redirect_to request.referer, notice: 'お気に入り登録しました！'
  end

  def destroy
    bookmark = current_user.bookmarks.find_by(place_id: @place.id)
    bookmark.destroy
    redirect_to request.referer, notice: 'お気に入り解除しました！'
  end

  # 非同期通信用アクション(places#indexのみ)
  def ajax_create
    bookmark = current_user.bookmarks.new(place_id: @place.id)
    bookmark.save
    @places = Place.all
  end

  def ajax_destroy
    bookmark = current_user.bookmarks.find_by(place_id: @place.id)
    bookmark.destroy
    @places = Place.all
  end

  def set_place
    @place = Place.find(params[:place_id])
  end
end
