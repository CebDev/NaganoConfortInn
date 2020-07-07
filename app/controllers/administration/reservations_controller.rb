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
    CustomerMailer.welcome_email(reservation.customer)
    session.delete(:shopping_cart)
    redirect_to root_path
  end

  private



end
