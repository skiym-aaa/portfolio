class PlacePhotosController < ApplicationController

  def show
  end

  def new
    @place = Place.find(params[:place_id])
    @place_photo = PlacePhoto.new
  end

  def create
    @place = Place.find(params[:place_id])
    @place_photo = PlacePhoto.new(place_photo_params)
    @place_photo.user_id = current_user.id
    @place_photo.place_id = @place.id
    binding.pry
    if @place_photo.save
      redirect_to place_path(@place), notice: "写真の追加が完了しました！"
    end
  end

  private

  def place_photo_params
    params.require(:place_photo).permit(:image_id)
  end

end
