class HomesController < ApplicationController
  def top
    @events = Event.all.order("RANDOM()").limit(3)
    @idols = Idol.all.order("RANDOM()").limit(3)
    @places = Place.all.order("RANDOM()").limit(3)
  end

  def about; end
end
