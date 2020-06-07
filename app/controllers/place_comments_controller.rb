class PlaceCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    @place_comment = PlaceComment.new(place_comment_params)
    @place_comment.user_id = current_user.id
    @place_comment.place_id = @place.id
    # NaturalLanguageでコメントをスコア化
    @place_comment_score = Language.get_data(place_comment_params[:body]).round(1)
    @place_comment.rate = if @place_comment_score < 0
                            2.5
                          elsif @place_comment_score.between?(0.1, 0.2)
                            3.0
                          elsif @place_comment_score.between?(0.3, 0.4)
                            3.5
                          elsif @place_comment_score.between?(0.5, 0.6)
                            4.0
                          elsif @place_comment_score.between?(0.7, 0.8)
                            4.5
                          else
                            5.0
                          end
    @place_comment.save
    flash.now[:notice] = 'コメントの作成が完了しました！'
    # ajaxのrender用
    @event = Event.where(place_id: params[:id])
  end

  def destroy
    @place_comment = PlaceComment.find(params[:id])
    @place = @place_comment.place
    @place_comment.destroy
    flash.now[:notice] = 'コメントの削除が完了しました！'
    # ajaxのrender用
    @place = Place.find(params[:place_id])
    @place_photos = PlacePhoto.where(place_id: @place.id)
    @new_place_comment = PlaceComment.new
    @event = Event.where(place_id: params[:place_id])
  end

  def place_comment_params
    params.require(:place_comment).permit(:body, :rate)
  end
end
