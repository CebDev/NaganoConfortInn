module RoomsHelper

  def room_status(room)
    html = "".html_safe
    if room.get_room_pricing_on_date("now").length == 0
      html << "<span class='glyphicon glyphicon-remove-circle red'></span>".html_safe
      html << "<p class='red'>No rate</p>".html_safe
    elsif room.status == "Busy"
      html << "<span class='glyphicon glyphicon-remove-circle red'></span>".html_safe
      if room.is_check_out_today?
        html << "<p class='red'>Check out</p>".html_safe
      else
        html << "<p class='red'>Busy</p>".html_safe
      end
    elsif room.status == "Ready"
      if room.is_check_in_today?
        html << "<span class='glyphicon glyphicon-remove-circle red'></span>".html_safe
        html << "<p class='red'>Reserved</p>".html_safe
        room.status = "Check in"
      else
        html << "<span class='glyphicon glyphicon-ok-circle green'></span>".html_safe
        html << "<p class='green'>Ready</p>".html_safe
      end
    elsif room.status == "Cleaning"
      html << "<span class='glyphicon glyphicon-ban-circle orange'></span>".html_safe
      html << "<p class='orange'>Cleaning</p>".html_safe
    end
    html
  end

end
