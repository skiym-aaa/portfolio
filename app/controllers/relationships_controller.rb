class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    # followはモデルで定義
    current_user.follow(params[:user_id])
    # redirect_to request.referer
    # ajax用
    @user = User.find(params[:id])
  end

  def destroy
    # unfollowはモデルで定義
    current_user.unfollow(params[:user_id])
    # redirect_to request.referer
    # ajax用
    @user = User.find(params[:id])
  end
end
