module RoomPricingsHelper

  def archive_old_room_pricing(room_price)
    room_price.archived_at = Time.new.strftime("%Y-%m-%d").to_s
    room_price.save
  end

  def status_css_class (room_price)
    if room_price.date_to.to_s < Time.new.strftime("%Y-%m-%d").to_s
      'inactive'
    elsif status_message(room_price) == "Current"
      'bold'
    end
  end

end
