class EventCommentsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @event_comment = EventComment.new(event_comment_params)
    @event_comment.user_id = current_user.id
    @event_comment.event_id = @event.id
    @event_comment.save
    flash[:notice] = "コメントの作成が完了しました！"
    redirect_to request.referer

  end

  def destroy
    binding.pry
    @event_comment = EventComment.find(params[:event_id])
    @event_comment.destroy
    flash[:notice] = "コメントの削除が完了しました！"
    redirect_to request.referer
  end

  def event_comment_params
    params.require(:event_comment).permit(:body)
  end

end
