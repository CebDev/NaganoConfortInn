module PagesHelper

  def get_free_rooms_on_date(date_from, date_to)
    Room.joins("LEFT JOIN reservation_rooms ON reservation_rooms.room_id = rooms.id")
        .where("reservation_rooms.id IS NULL OR reservation_rooms.date_to < DATE('#{date_from}') OR reservation_rooms.date_from > DATE('#{date_to}')" )
  end

end
