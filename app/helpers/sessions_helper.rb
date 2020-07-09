module SessionsHelper

  def current_customer
    if session[:customer_id]
      current_customer ||= Customer.find(session[:customer_id])
    end
  end

  def logged_in?
    !current_customer.nil?
  end

end
