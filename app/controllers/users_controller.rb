class UsersController < ApplicationController
  before_action :baria_user, except: [:confirm]
  before_action :set_calender, only: [:show]

  def show
    @user = User.find(params[:id])
    @events = Event.where(idol_id: @user.favorite_idols.ids).or(Event.where(place_id: @user.bookmark_places.ids))
    @registered_events = Event.where(id: @user.event_event_registers.ids)
    @event_array = []
    @registered_events.each do |event|
      ev = {}
      ev['title'] = event.title
      ev['start'] = event.start_date
      ev['end'] = event.end_date
      ev['url'] = event_url(event, format: :html)
      @event_array << ev
    end
    gon.events = @event_array
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '編集が完了しました！'
    else
      render :edit
    end
  end

  def confirm
    @user = current_user
  end

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = 'ありがとうございました。またのご利用を心よりお待ちしております。'
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :image_id, :encrypted_password, :reset_password_token)
  end

  def baria_user
    redirect_to root_path unless params[:id].to_i == current_user.id
  end
end
