module ApplicationHelper

  def active_link? (*test_paths)
    test_paths.each do |test_path|
      return 'active' if request.path == test_path
    end
  end

  def status_message (room_price)
    if room_price.date_from.to_s <= Time.new.strftime("%Y-%m-%d").to_s && Time.new.strftime("%Y-%m-%d").to_s <= room_price.date_to.to_s
      "Current"
    elsif room_price.archived_at != nil
      "Archived"
    end
  end

  def get_current_room_pricing (room)
    RoomPricing
        .where("date_from <= DATE('now') AND date_to >= DATE('now')")
        .where(room_view_id: room.room_view_id, room_type_id: room.room_type_id, archived_at: nil)
  end

  def get_price_per_night (date, room)
    room_pricings = RoomPricing
                       .where("date_from <= '#{date}' AND date_to >= '#{date}'")
                       .where(room_view_id: room.room_view_id, room_type_id: room.room_type_id, archived_at: nil)
    room_pricings.each do |room_pricing|
      if date.to_date.saturday? || date.to_date.sunday?
        return room_pricing.price_week_end.to_f
      end
      return room_pricing.price_open_day.to_f
    end
  end

  def get_price_per_stay (date_from, date_to, room)
    date_from = date_from.to_date
    date_to = date_to.to_date
    total_price = 0.0
    while date_from <= date_to
      night_price = get_price_per_night(date_from, room)
      total_price += night_price
      date_from += 1
    end
    total_price.to_f
  end

end
