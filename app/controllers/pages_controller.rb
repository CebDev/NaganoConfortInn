class PagesController < ApplicationController
  def index
    @title = 'NaganoConforInn'
    @room_types = RoomType.all
    @room_view = RoomView.all
  end

  def search

    if params[:date_from].blank?
      redirect_to(root_path, alert: "Empty field!")
    else
      @rooms = get_free_rooms_on_date(params[:date_from], params[:date_to])
                   .order("number ASC")
    end
  end

  private

  def get_free_rooms_on_date(date_from, date_to)
    Room.joins("LEFT JOIN reservation_rooms ON reservation_rooms.room_id = rooms.id")
        .where("reservation_rooms.id IS NULL OR reservation_rooms.date_to < DATE('#{date_from}') OR reservation_rooms.date_from > DATE('#{date_to}')" )
  end

end
