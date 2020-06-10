class EventsController < InheritedResources::Base
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_event, only: %i[show edit update destroy]
  before_action :set_calender, only: %i[new create]
  before_action :set_event_calender, only: %i[show edit update]

  # GET /events
  # GET /events.json
  def index
    @events = Event.order(:start_date)
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
    # 今月のイベントの情報取得
    this_month = Date.today.all_month
    @this_month_events = @events.where(start_date: this_month).where('start_date >= ?', Date.today).order(:start_date)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @idol = Idol.find(@event.idol_id)
    @place = Place.find(@event.place_id)
    @event_photos = EventPhoto.where(event_id: @event.id)
    @event_comment = EventComment.new
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'イベントの登録が完了しました！' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'イベントの編集が完了しました！' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'イベントの削除が完了しました！' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def set_event_calender
    @event_array = []
    ev = {}
    ev['title'] = @event.title
    ev['start'] = @event.start_date
    ev['end'] = @event.end_date
    ev['url'] = event_url(@event, format: :html)
    @event_array << ev
    gon.events = @event_array
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:user_id, :idol_id, :place_id, :title, :genre, :body, :open_date, :start_date, :end_date)
  end

end
