class Statistics

  def total_income_per_day(rooms)
    total_income_of_day = 0
    rooms.each { |room| total_income_of_day += room.get_price_per_night(Date.today)}
    total_income_of_day
  end

  def total_income_per_period(date_from, date_to)
    income = 0
    (date_from..date_to).each do |d|
      reservation_rooms = ReservationRoom.preload(:room).where("date_from <= ? AND date_to >= ?", d, d)
      reservation_rooms.each { |reservation_room| income += reservation_room.room.get_price_per_night(d)}
    end
    income
  end

end


