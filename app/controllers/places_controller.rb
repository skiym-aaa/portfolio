class PlacesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_calender, only: %i[index new create]
  before_action :set_place_calender, only: %i[show edit update]

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @place_photos = PlacePhoto.where(place_id: @place.id)
    @next_events = Event.where(place_id: params[:id]).where('start_date >= ?', Date.today).order(:start_date)
    @place_comment = PlaceComment.new
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      redirect_to place_path(@place), notice: '場所の登録が完了しました！'
    else
      render :new
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.user_id = current_user.id
    if @place.update(place_params)
      redirect_to place_path(@place), notice: '場所の編集が完了しました！'
    else
      render :edit
    end
  end

  def set_place_calender
    @events = Event.where(place_id: params[:id])
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

  def place_params
    params.require(:place).permit(:user_id, :name, :address, :about, :official_site, :image_id)
  end

end
