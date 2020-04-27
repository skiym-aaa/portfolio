class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @place_comment = PlaceComment.new
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      redirect_to place_path(@place), notice: "場所の登録が完了しました！"
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
      redirect_to place_path(@place), notice: "場所の編集が完了しました！"
    else
      render :edit
    end
  end

  private

  def place_params
    params.require(:place).permit(:user_id, :name ,:address, :about, :official_site, :image_id)
  end

end
