class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    # redirect_to request.referer
    # ajax用
    @user = User.find(params[:user_id])
  end

  def destroy
    current_user.unfollow(params[:user_id])
    # redirect_to request.referer
    # ajax用
    @user = User.find(params[:user_id])
  end

  def follower
    user = User.find(params[:user_id])
    @users = user.following_user
  end

  def followed
    user = User.find(params[:user_id])
    @users = user.follower_user
  end
end
