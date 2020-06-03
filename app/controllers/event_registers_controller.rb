class EventRegistersController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    register = current_user.event_registers.new(event_id: @event.id)
    register.save
    redirect_to request.referer, notice: 'イベント登録しました！'
  end

  def destroy
    @event = Event.find(params[:event_id])
    register = current_user.event_registers.find_by(event_id: @event.id)
    register.destroy
    redirect_to request.referer, notice: 'イベント登録を解除しました！'
  end
end
