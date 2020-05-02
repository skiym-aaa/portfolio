class IdolsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @idols = Idol.all
  end

  def show
    @idol = Idol.find(params[:id])
  end

  def new
    @idol = Idol.new
  end

  def create
    @idol = Idol.new(idol_params)
    @idol.user_id = current_user.id
    if @idol.save
      redirect_to idol_path(@idol), notice: 'アイドルの登録が完了しました！'
    else
      render :new
    end
  end

  def edit
    @idol = Idol.find(params[:id])
  end

  def update
    @idol = Idol.find(params[:id])
    @idol.user_id = current_user.id
    if @idol.update(idol_params)
      redirect_to idol_path(@idol), notice: 'アイドルの編集が完了しました！'
    else
      render :edit
    end
  end

  private

  def idol_params
    params.require(:idol).permit(:user_id, :name, :about, :official_site, :image_id)
  end
end
