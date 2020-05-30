class HomesController < ApplicationController
  before_action :set_calender, only: [:top]

  def top
    # 本番環境で'RANDOM変数は使用できない'
    if Rails.env.production?
      @events = Event.all.order('RAND()').limit(3)
      @idols = Idol.all.order('RAND()').limit(3)
      @places = Place.all.order('RAND()').limit(3)
    else
      @events = Event.all.order('RANDOM()').limit(3)
      @idols = Idol.all.order('RANDOM()').limit(3)
      @places = Place.all.order('RANDOM()').limit(3)
    end
  end

  def about; end
end
