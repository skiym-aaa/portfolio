class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_idol

  # homes#topのランダム表示を切り替えるために、通常アクションと非同期通信アクションを作成
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

  # 非同期通信用アクション(idols#indexのみ)
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
