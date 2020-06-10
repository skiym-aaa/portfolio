class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idol

  def create
    favorite = current_user.favorites.new(idol_id: @idol.id)
    favorite.save
    redirect_to request.referer, notice: 'お気に入り登録しました！'
  end

  def destroy
    favorite = current_user.favorites.find_by(idol_id: @idol.id)
    favorite.destroy
    redirect_to request.referer, notice: 'お気に入り解除しました！'
  end

  # 非同期通信用アクション
  def ajax_create
    favorite = current_user.favorites.new(idol_id: @idol.id)
    favorite.save
    @idols = Idol.all
  end

  def ajax_destroy
    favorite = current_user.favorites.find_by(idol_id: @idol.id)
    favorite.destroy
    @idols = Idol.all
  end

  def set_idol
    @idol = Idol.find(params[:idol_id])
  end
end
