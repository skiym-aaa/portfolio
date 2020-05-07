class HomesController < ApplicationController
  def top
    if Rails.env.production?
      @events = Event.all.order('RAND()').limit(3)
      @idols = Idol.all.order('RAND()').limit(3)
      @places = Place.all.order('RAND()').limit(3)
    elsif Rails.env.development?
      @events = Event.all.order('RANDOM()').limit(3)
      @idols = Idol.all.order('RANDOM()').limit(3)
      @places = Place.all.order('RANDOM()').limit(3)
    end
  end

  def about; end
end
