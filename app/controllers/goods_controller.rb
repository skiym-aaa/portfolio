class GoodsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @event_photo = EventPhoto.find(params[:event_photo_id])
    good = current_user.goods.new(event_id: @event.id, event_photo_id: @event_photo.id)
    good.save
    redirect_to request.referer
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event_photo = EventPhoto.find(params[:event_photo_id])
    good = current_user.goods.find_by(event_id: @event.id, event_photo_id: @event_photo.id)
    good.destroy
    redirect_to request.referer
  end
end
