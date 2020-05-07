class PlacePhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_calender, only: [:new]

  def show
    @place_photos = PlacePhoto.where(place_id: params[:place_id])
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
    if @place_photo.save
      redirect_to place_path(@place), notice: '写真の追加が完了しました！'
    else
      render :new
    end
  end

  private

  def place_photo_params
    params.require(:place_photo).permit(:image_id)
  end
end
