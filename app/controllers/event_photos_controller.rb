class EventPhotosController < ApplicationController
  before_action :authenticate_user!, except: %i[show]

  def show
    @event = Event.find(params[:event_id])
    @event_photo = EventPhoto.find(params[:id])
    # カレンダー表示
    @event_array = []
    ev = {}
    ev['title'] = @event.title
    ev['start'] = @event.start_date
    ev['end'] = @event.end_date
    ev['url'] = event_url(@event, format: :html)
    @event_array << ev
    gon.events = @event_array
  end

  def new
    @event = Event.find(params[:event_id])
    @event_photo = EventPhoto.new
    # カレンダー表示
    @event_array = []
    ev = {}
    ev['title'] = @event.title
    ev['start'] = @event.start_date
    ev['end'] = @event.end_date
    ev['url'] = event_url(@event, format: :html)
    @event_array << ev
    gon.events = @event_array
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
      tags = Vision.get_face_data(@event_photo.image_id.url)
      tags.each do |tag|
        @event_photo.tags.create(name: tag)
      end
      # redirect_to event_path(@event), notice: '写真の追加が完了しました！'
    else
      render :new
    end
  end

  private

  def event_photo_params
    params.require(:event_photo).permit(:image_id)
  end
end
