class HomesController < ApplicationController
  before_action :set_calender, only: [:top]

  def top
    # 本番環境で'RANDOM変数は使用できない'
    if Rails.env.production?
      # 当日のイベント情報を取得
      @today = Date.today
      @today_events = Event.all.where(start_date: @today.all_day)

      @events = Event.all.order('RAND()').limit(3)
      @idols = Idol.all.order('RAND()').limit(3)
      @places = Place.all.order('RAND()').limit(3)
    else
      @today = Date.today
      @today_events = Event.all.where(start_date: @today.all_day)

      @events = Event.all.order('RANDOM()').limit(3)
      @idols = Idol.all.order('RANDOM()').limit(3)
      @places = Place.all.order('RANDOM()').limit(3)
    end
  end

  def about; end
end
