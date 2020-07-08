class Administration::AdministrationController < ApplicationController

  layout "administration"

  def index
    @title = 'NCI administration'
    rooms = Room.all
    today_rooms_reserved = Room.joins('INNER JOIN reservation_rooms ON reservation_rooms.room_id = rooms.id').where("date_from = ?", Date.today )
    stats = Statistics.new

    # **** Statistics overview ****
    # occupancy
    @nbr_total_room = rooms.length
    @nbr_room_checked_in = today_rooms_reserved.length
    #income of the day
    @total_income_possibility = stats.total_income_per_day(rooms)
    @total_income_of_day = stats.total_income_per_day(today_rooms_reserved)
    #month result until today
    date = Date.today
    @month_income_until_today = stats.total_income_per_period(Date.new(date.year, date.month, 1), Date.current)
    #estimated month result
    @month_estimated_income = stats.total_income_per_period(Date.new(date.year, date.month, 1), Date.new(date.year, date.month, -1))
    # **** Check ****
    # Check in
    @room_reservations = ReservationRoom.preload(:room, :reservation).where("date_from = ?", Date.current )
    # check out
    @room_reservations_check_out = ReservationRoom.preload(:room, :reservation).where("date_to = ?", Date.current )
  end

  def overview
    @rooms = Room.order("floor ASC, number ASC")
  end

end
