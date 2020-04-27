class PlaceCommentsController < ApplicationController

  def create
    @place = Place.find(params[:place_id])
    @place_comment = PlaceComment.new(place_comment_params)
    @place_comment.user_id = current_user.id
    @place_comment.place_id = @place.id
    @place_comment.save
    flash[:notice] = "コメントの作成が完了しました！"
    redirect_to request.referer

  end

  def destroy
    @place_comment = PlaceComment.find(params[:place_id])
    @place_comment.destroy
    flash[:notice] = "コメントの削除が完了しました！"
    redirect_to request.referer
  end

  def place_comment_params
    params.require(:place_comment).permit(:body, :rate)
  end

end
