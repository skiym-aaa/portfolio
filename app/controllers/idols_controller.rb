class IdolsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_calender, only: %i[index new]
  before_action :set_idol_calender, only: %i[show edit]

  def index
    @idols = Idol.all
  end

  def show
    @idol = Idol.find(params[:id])
    @event_photos = EventPhoto.includes(:event).where(events: { idol_id: @idol.id })
    @next_events = Event.where(idol_id: params[:id]).where('start_date >= ?', Date.today).order(:start_date)
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
    params.require(:idol).permit(:user_id, :name, :about, :image_id,
                                 :official_site, :official_twitter, :official_youtube)
  end

  def set_idol_calender
    @events = Event.where(idol_id: params[:id])
    @event_array = []
    @events.each do |event|
      ev = {}
      ev['title'] = event.title
      ev['start'] = event.start_date
      ev['end'] = event.end_date
      ev['url'] = event_url(event, format: :html)
      @event_array << ev
    end
    gon.events = @event_array
  end
end
