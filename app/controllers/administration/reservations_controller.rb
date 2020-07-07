class Administration::ReservationsController < ApplicationController

  layout "administration"

  def index
    @reservations = Reservation.all
  end

  def new
    @room_types = RoomType.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    reservation = Reservation.new(params[:reservation])
    reservation.save
    shopping_cart = session[:shopping_cart]
    shopping_cart.each do |line|
      room_type_id = RoomType.find_by_title(line[:room_type])
      room_view_id = RoomView.find_by_title(line[:room_view])
      room = get_free_rooms_on_date(line[:date_from], line[:date_to])
                 .where("room_type_id = ?", room_type_id)
                 .where("room_view_id = ?", room_view_id)
                 .first
      binding.pry
      reservation_room = ReservationRoom.new(reservation_id: reservation.id,
                                             room_id: room.id,
                                             date_from: line[:date_from],
                                             date_to: line[:date_to])
      reservation_room.save
    end
    CustomerMailer.welcome_email(reservation.customer)
    session.delete(:shopping_cart)
    redirect_to root_path
  end

  private

  def get_free_rooms_on_date(date_from, date_to)
    Room.joins("LEFT JOIN reservation_rooms ON reservation_rooms.room_id = rooms.id")
        .where("reservation_rooms.id IS NULL OR (reservation_rooms.date_to < DATE('#{date_from}') AND reservation_rooms.date_from > DATE('#{date_to}'))" )
  end

end
