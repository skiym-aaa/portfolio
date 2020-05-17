class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @idol = Idol.find(params[:idol_id])
    favorite = current_user.favorites.new(idol_id: @idol.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @idol = Idol.find(params[:idol_id])
    favorite = current_user.favorites.find_by(idol_id: @idol.id)
    favorite.destroy
    redirect_to request.referer
  end

  # 非同期通信用アクション
  def ajax_create
    @idol = Idol.find(params[:idol_id])
    favorite = current_user.favorites.new(idol_id: @idol.id)
    favorite.save
    @idols = Idol.all
  end

  def ajax_destroy
    @idol = Idol.find(params[:idol_id])
    favorite = current_user.favorites.find_by(idol_id: @idol.id)
    favorite.destroy
    @idols = Idol.all
  end
end
