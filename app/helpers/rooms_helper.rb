module RoomsHelper

  def set_status_class(room)
    html = "".html_safe
    if room.status == "Ready"
      html << "<span class='glyphicon glyphicon-ok-circle green'></span>".html_safe
      html << "<p class='green'>Ready</p>".html_safe
    elsif room.status == "Busy"
      html << "<span class='glyphicon glyphicon-remove-circle red'></span>".html_safe
      html << "<p class='red'>Busy</p>".html_safe
    else
      html << "<span class='glyphicon glyphicon-ban-circle orange'></span>".html_safe
      html << "<p class='orange'>Cleaning</p>".html_safe
    end

  end

  def get_current_room_pricing (room)
    RoomPricing
        .where("date_from <= DATE('now') AND date_to >= DATE('now')")
        .where(room_view_id: room.room_view_id, room_type_id: room.room_type_id, archived_at: nil)

  end

  def get_room_pricing (room)
    RoomPricing.where(room_view_id: room.room_view_id, room_type_id: room.room_type_id, archived_at: nil)
  end

end
