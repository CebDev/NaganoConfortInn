class Administration::ReservationsController < ApplicationController

  layout "administration"

  def index
    @reservations = Reservation.all
  end

  def new
    @room_types = RoomType.all
  end

end
