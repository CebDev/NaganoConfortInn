class Administration::AdministrationController < ApplicationController

  layout "administration"

  def index
    @title = 'NCI administration'
    @nbr_total_room = Room.all.length
    @nbr_room_checked_in = Room.where(status: "Busy").length
  end

  def overview
    @rooms = Room.order("floor ASC, number ASC")
  end

  def check_in
    @room_reservation = ReservationRoom.where("date_from = ?", Time.new.strftime("%Y-%m-%d").to_s )
  end

end
