class EventsController < InheritedResources::Base

def index
  # カレンダー情報はここからしか呼べない？
  @events = Event.all
end

  private

    def event_params
      params.require(:event).permit(:title, :body, :start_date, :end_date)
    end

end
