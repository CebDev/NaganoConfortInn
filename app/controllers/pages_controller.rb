class PagesController < ApplicationController

  before_filter :get_all_room_types, only: [:index, :search]


  def index
    @title = 'NaganoConforInn'
  end

  def search
    @title = 'NCI room search'
    if params[:date_from].blank?
      redirect_to(root_path, alert: "Empty field!")
    else
      number_of_room = params[:number_of_room] ? params[:number_of_room].to_i : 1
      capacity_limit = (params[:number_of_adults].to_i + params[:number_of_children].to_i) / number_of_room
      @rooms = get_free_rooms_on_date(params[:date_from], params[:date_to])
                   .where("capacity >= ?", capacity_limit)
                   .order("number ASC")
                   .group("room_type_id, room_view_id")
      unless params[:room_type].empty?
        @rooms = @rooms.where("room_type_id = ?", params[:room_type])
      end
      if params[:view_ocean] != "0" && !params[:view_ocean].empty?
        @rooms = @rooms.where("room_view_id = ?", params[:view_ocean])
      end
    end
    session[:last_search_uri] = request.env['REQUEST_URI']
  end

  def shopping_cart
  end

  def sign_up
    @title = 'NCI sign up'
    @customer = Customer.new
  end

  private

  def get_all_room_types
    @room_types = RoomType.all
  end

  def get_free_rooms_on_date(date_from, date_to)
    Room.joins("LEFT JOIN reservation_rooms ON reservation_rooms.room_id = rooms.id")
        .where("reservation_rooms.id IS NULL OR reservation_rooms.date_to < DATE('#{date_from}') OR reservation_rooms.date_from > DATE('#{date_to}')" )
  end

end
