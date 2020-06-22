module RoomPricingsHelper

  def archive_old_room_pricing(room_price)
    room_price.archived_at = Time.new.strftime("%Y-%m-%d").to_s
    room_price.save
  end

  def class_archived (room_price)
    'inactive' if room_price.date_to.to_s < Time.new.strftime("%Y-%m-%d").to_s
  end

end
