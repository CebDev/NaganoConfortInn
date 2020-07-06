class Administration::AdministrationController < ApplicationController

  layout "administration"

  def index
    # **** Statistique overview ****
    # occupancy
    rooms = Room.all
    rooms_reserved = ReservationRoom.where("date_from = ?", Time.new.strftime("%Y-%m-%d").to_s )
    @title = 'NCI administration'
    @nbr_total_room = rooms.length
    @nbr_room_checked_in = rooms_reserved.length
    #income of the day
    @total_income_possibility = 0
    rooms.each { |room| @total_income_possibility += room.get_price_per_nigth(Date.today)}
    @total_income_of_day = 0
    rooms_reserved.each { |room_reserved| @total_income_of_day += room_reserved.room.get_price_per_nigth(Date.today)}
    #month result until today
    @month_income = 0
    date = Date.today
    (Date.new(date.year, date.month, 1)..Date.today).each do |d|
      month_rooms_reserved = ReservationRoom.where("date_from <= ? AND date_to >= ?", d, d)
      month_rooms_reserved.each { |room_reserved| @month_income += room_reserved.room.get_price_per_nigth(d)}
    end
    #estimated month result
    @month_estimated_income = @month_income
    ((Date.today+1)..Date.new(date.year, date.month, -1)).each do |d|
      month_rooms_reserved = ReservationRoom.where("date_from <= ? AND date_to >= ?", d, d)
      month_rooms_reserved.each { |room_reserved| @month_estimated_income += room_reserved.room.get_price_per_nigth(d)}
    end

    # **** Check ****
    # Check in
    @room_reservation = rooms_reserved
    # check out
    @room_reservation_check_out = ReservationRoom.where("date_to = ?", Time.new.strftime("%Y-%m-%d").to_s )
  end

  def overview
    @rooms = Room.order("floor ASC, number ASC")
  end

end
