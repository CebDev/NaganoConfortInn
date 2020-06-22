module RoomsHelper

  def set_status_class (room)
    if room.status == "Ready"
      'green'
    elsif room.status == "Busy"
      'red'
    else
      'orange'
    end
  end

  def get_room_pricing (room)
    RoomPricing.where(room_view_id: room.room_view_id, room_type_id: room.room_type_id, archived_at: nil)
  end

end
