class PlacePhotosController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :set_place_photo_calender, only: %i[show new]

  def show
    @place = Place.find(params[:place_id])
    @place_photo = PlacePhoto.find(params[:id])
  end

  def new
    @place = Place.find(params[:place_id])
    @place_photo = PlacePhoto.new
  end

  def create
    @place = Place.find(params[:place_id])
    @place_photo = if params[:place_photo].present?
                     PlacePhoto.new(place_photo_params)
                   else
                     PlacePhoto.new(image_id: '')
                   end
    @place_photo.user_id = current_user.id
    @place_photo.place_id = @place.id
    @place_photo.image_id = params[:file]
    if @place_photo.save
      # VisionAIでタグ付け(ラベル)
      tags = Vision.get_image_data(@place_photo.image_id.url)
      tags.each do |tag|
        @place_photo.tags.create(name: tag)
      end
    else
      render :new
    end
  end

  def destroy
    place_photo = PlacePhoto.find(params[:id])
    place_photo.destroy
    redirect_to request.referer, notice: '投稿を削除しました！'
  end

  def set_place_photo_calender
    @events = Event.where(place_id: params[:place_id])
    @event_array = []
    @events.each do |event|
      ev = {}
      ev['start'] = event.start_date
      ev['end'] = event.end_date
      ev['url'] = event_url(event, format: :html)
      @event_array << ev
    end
    gon.events = @event_array
  end

  private

  def place_photo_params
    params.require(:place_photo).permit(:image_id)
  end

end
