module SessionsHelper

  def log_in(customer)
    session[:customer_id] = customer.id
  end

  def log_out
    session.delete(:customer_id)
  end

  def current_customer
    if session[:customer_id]
      current_customer ||= Customer.find(session[:customer_id])
    end
  end

  def logged_in?
    !current_customer.nil?
  end

end
