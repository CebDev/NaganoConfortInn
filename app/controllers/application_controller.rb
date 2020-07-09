class ApplicationController < ActionController::Base
  protect_from_forgery

  def log_in(customer)
    session[:customer_id] = customer.id
  end

  def log_out
    session.delete(:customer_id)
    session.delete(:shopping_cart)
  end

end
