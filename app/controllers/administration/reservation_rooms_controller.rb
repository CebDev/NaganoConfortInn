class Administration::ReservationRoomsController < ApplicationController

  layout "administration"

  def index
    @reservation_rooms = ReservationRoom.all
  end

  def new
    @reservation_room = ReservationRoom.new
    @rooms = Room.order("number ASC")
  end

  def create
    @reservation_room = ReservationRoom.new(params[:reservation_room])
    if @reservation_room.save
      flash[:notice] = "Your reservation was saved successfully."
      redirect_to new_reservation_room_path
    else
      render 'new'
    end
  end

end
