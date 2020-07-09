class SessionsController < ApplicationController

  def new
  end

  def create
    binding.pry
    customer = Customer.find_by_email params[:session][:email]
    if customer
      log_in customer
      redirect_to index_path
    else
      flash[:error] = "Log in error. Please check your information"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end



end
