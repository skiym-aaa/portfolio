class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    bookmark = current_user.bookmarks.new(place_id: @place.id)
    bookmark.save
    redirect_to request.referer
  end

  def destroy
    @place = Place.find(params[:place_id])
    bookmark = current_user.bookmarks.find_by(place_id: @place.id)
    bookmark.destroy
    redirect_to request.referer
  end

  # 非同期通信用アクション
  def ajax_create
    @place = Place.find(params[:place_id])
    bookmark = current_user.bookmarks.new(place_id: @place.id)
    bookmark.save
    @places = Place.all
  end

  def ajax_destroy
    @place = Place.find(params[:place_id])
    bookmark = current_user.bookmarks.find_by(place_id: @place.id)
    bookmark.destroy
    @places = Place.all
  end
end
