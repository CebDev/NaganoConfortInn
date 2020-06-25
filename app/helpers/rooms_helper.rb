module RoomsHelper

  def room_status(room)
    html = "".html_safe
    if room.get_room_pricing_on_date("now").length == 0
      html << "<span class='glyphicon glyphicon-remove-circle red'></span>".html_safe
      html << "<p class='red'>No rate</p>".html_safe
    elsif room.status == "Busy"
      html << "<span class='glyphicon glyphicon-remove-circle red'></span>".html_safe
      html << "<p class='red'>Busy</p>".html_safe
    elsif room.status == "Ready"
      html << "<span class='glyphicon glyphicon-ok-circle green'></span>".html_safe
      html << "<p class='green'>Ready</p>".html_safe
    else
      html << "<span class='glyphicon glyphicon-ban-circle orange'></span>".html_safe
      html << "<p class='orange'>Cleaning</p>".html_safe
    end
  end



end
