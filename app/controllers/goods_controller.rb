class GoodsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @event_photo = EventPhoto.find(params[:event_photo_id])
    good = current_user.goods.new(event_id: @event.id, event_photo_id: @event_photo.id)
    good.save
    # redirect_to request.referer
    # ajax用
    @user = current_user
    relation = EventPhoto.includes(:event)
    @event_photos = relation
                    .where(user_id: @user.id)
                    .or(relation.where(user_id: @user.following_user.ids))
                    .or(relation.where(event_id: @user.event_event_registers.ids))
                    .or(relation.where(events: {idol_id: @user.favorite_idols.ids}))
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event_photo = EventPhoto.find(params[:event_photo_id])
    good = current_user.goods.find_by(event_id: @event.id, event_photo_id: @event_photo.id)
    good.destroy
    # redirect_to request.referer
    @user = current_user
    relation = EventPhoto.includes(:event)
    @event_photos = relation
                    .where(user_id: @user.id)
                    .or(relation.where(user_id: @user.following_user.ids))
                    .or(relation.where(event_id: @user.event_event_registers.ids))
                    .or(relation.where(events: {idol_id: @user.favorite_idols.ids}))
  end
end
