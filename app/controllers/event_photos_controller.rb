class EventPhotosController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :set_event_photo_calender, only: %i[show new]

  def show
    @event_photo = EventPhoto.find(params[:id])
  end

  def new
    @event_photo = EventPhoto.new
  end

  def create
    @event = Event.find(params[:event_id])
    @event_photo = if params[:event_photo].present?
                     EventPhoto.new(event_photo_params)
                   else
                     EventPhoto.new(image_id: '')
                   end
    @event_photo.user_id = current_user.id
    @event_photo.event_id = @event.id
    @event_photo.image_id = params[:file]
    if @event_photo.save
      # VisionAIでタグ付け(顔認識)
      unless Vision.get_face_data(@event_photo.image_id.url).nil?
        tags = Vision.get_face_data(@event_photo.image_id.url)
        tags.each do |tag|
          @event_photo.tags.create(name: tag)
        end
      end
    else
      render :new
    end
  end

  def destroy
    event_photo = EventPhoto.find(params[:id])
    event_photo.destroy
    redirect_to request.referer, notice: '投稿を削除しました！'
  end

  def set_event_photo_calender
    @event = Event.find(params[:event_id])
    @event_array = []
    ev = {}
    ev['title'] = @event.title
    ev['start'] = @event.start_date
    ev['end'] = @event.end_date
    ev['url'] = event_url(@event, format: :html)
    @event_array << ev
    gon.events = @event_array
  end

  private

  def event_photo_params
    params.require(:event_photo).permit(:image_id)
  end

end
