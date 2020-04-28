class BookmarksController < ApplicationController
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
end
