class ShoppingCartsController < ApplicationController

  def show
    @shopping_cart = []
    if session[:shopping_cart]
      session[:shopping_cart].each { |reservation_room_id| @shopping_cart << ReservationRoom.find(reservation_room_id) }
    end

    @reservation = Reservation.new
    @setting = Setting.first
  end

  def add
    session[:shopping_cart] ||= []
    room = get_free_rooms_on_date(params[:add_to_shopping_cart][:date_from], params[:add_to_shopping_cart][:date_to])
               .where("room_type_id = ?", params[:add_to_shopping_cart][:room_type_id])
               .where("room_view_id = ?", params[:add_to_shopping_cart][:room_view_id])
               .first
    reservation_room = ReservationRoom.new(reservation_id: -1,
                                           room_id: room.id,
                                           date_from: params[:add_to_shopping_cart][:date_from],
                                           date_to: params[:add_to_shopping_cart][:date_to])
    reservation_room.save
    session[:shopping_cart] << reservation_room.id
    redirect_to session[:last_search_uri]
  end

  def delete
    ReservationRoom.delete(session[:shopping_cart][params[:remove_index].to_i])
    session[:shopping_cart].delete_at(params[:remove_index].to_i)
    redirect_to shopping_cart_path
  end

  private
  def get_free_rooms_on_date(date_from, date_to)
    Room.joins("LEFT JOIN reservation_rooms ON reservation_rooms.room_id = rooms.id")
        .where("reservation_rooms.id IS NULL OR (reservation_rooms.date_to < DATE('#{date_from}') AND reservation_rooms.date_from > DATE('#{date_to}'))" )
  end

end