class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_calender
    @events = Event.all
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
