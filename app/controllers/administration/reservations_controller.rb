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
    shopping_cart.each do |room_reservation_id|
      reservation_room = ReservationRoom.find(room_reservation_id)
      reservation_room.reservation_id = reservation.id
      reservation_room.save
    end
    CustomersMailer.reservation_confirmation(reservation).deliver
    session.delete(:shopping_cart)
    redirect_to root_path
  end

  def send_confirmation_mail
    reservation = Reservation.find(params[:reservation_id])
    CustomersMailer.reservation_confirmation(reservation).deliver
    redirect_to administration_reservation_path(reservation)
  end



end
