class RoomsController < ApplicationController

  def index
    @rooms = Room.order("floor ASC, number ASC")
  end

  def new
    @btn_text = "Create"
    @room = Room.new
    @room_types = RoomType.all
    @room_views = RoomView.all
  end

  def create
    @room = Room.new(params[:room])
    if @room.save
      flash[:notice] = "Your new rate periods was saved successfully."
      redirect_to rooms_path
    else
      @btn_text = "Create"
      @room = Room.new(params[:room])
      @room_types = RoomType.all
      @room_views = RoomView.all
      render 'room/new'
    end
  end

end
