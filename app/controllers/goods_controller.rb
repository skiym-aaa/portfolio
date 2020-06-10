class GoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_good_ajax

  def create
    good = current_user.goods.new(event_id: @event.id, event_photo_id: @event_photo.id)
    good.save
    # redirect_to request.referer
  end

  def destroy
    good = current_user.goods.find_by(event_id: @event.id, event_photo_id: @event_photo.id)
    good.destroy
    # redirect_to request.referer
  end

  def set_good_ajax
    @event = Event.find(params[:event_id])
    @event_photo = EventPhoto.find(params[:event_photo_id])
    @user = User.find(params[:id])
    relation = EventPhoto.includes(:event)
    @event_photos = relation
                    .where(user_id: @user.id)
                    .or(relation.where(user_id: @user.following_user.ids))
                    .or(relation.where(event_id: @user.event_event_registers.ids))
                    .or(relation.where(events: { idol_id: @user.favorite_idols.ids }))
  end
end
