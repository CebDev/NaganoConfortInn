class CustomersController < ApplicationController

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:notice] = "Your logged successfully."
      log_in @customer
      redirect_to index_path
    else
      render 'pages/sign_up'
    end
  end

end