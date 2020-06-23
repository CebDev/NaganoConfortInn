class ReservationRoomsController < ApplicationController

  def index
    @rooms = Room.order("number ASC")
  end

  def new
    @reservation_room = ReservationRoom.new
    @rooms = Room.order("number ASC")
  end

  def create

  end

end
