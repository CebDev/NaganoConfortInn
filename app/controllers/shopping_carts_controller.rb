class ShoppingCartsController < ApplicationController

  def show
    @shopping_cart = session[:shopping_cart] || []
    @reservation = Reservation.new
    @setting = Setting.first
  end

  def add
    session[:shopping_cart] ||= []
    session[:shopping_cart] << params[:add_to_shopping_cart]
    redirect_to shopping_cart_path
  end

  def delete
    session[:shopping_cart].delete_at(params[:remove_index].to_i)
    redirect_to shopping_cart_path
  end

end