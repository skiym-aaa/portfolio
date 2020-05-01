class EventCommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event_comment = EventComment.new(event_comment_params)
    @event_comment.user_id = current_user.id
    @event_comment.event_id = @event.id
    @event_comment.save
    flash.now[:notice] = 'コメントの作成が完了しました！'
    # ajaxのrender用
    @idol = Idol.find(@event.idol_id)
    @place = Place.find(@event.place_id)
  end

  def destroy
    @event_comment = EventComment.find(params[:event_id])
    @event_comment.destroy
    flash.now[:notice] = 'コメントの削除が完了しました！'
    # ajaxのrender用
    @event = Event.find(params[:id])
    @idol = Idol.find(@event.idol_id)
    @place = Place.find(@event.place_id)
    @new_event_comment = EventComment.new
  end

  def event_comment_params
    params.require(:event_comment).permit(:body)
  end
end
