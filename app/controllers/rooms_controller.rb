class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def create
    @room = Room.new
    @room.save
    redirect_to rooms_path
  end

  def show
    @room = Room.find(params[:id])
    @chats = @room.chats.recent.limit(10).reverse
  end
end
