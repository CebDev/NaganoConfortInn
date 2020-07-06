class CustomersController < ApplicationController

  def edit
    @customer = Customer.find(current_customer)
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:notice] = "Your logged successfully."
      log_in @customer
      CustomerMailer.welcome_email
      redirect_to index_path
    else
      render 'pages/sign_up'
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(params[:customer])
      flash[:notice] = "Your profil was updated successfully."
      redirect_to edit_customer_path @customer
    else
      render 'edit'
    end
  end

  def reservations
    @reservations = Reservation.where("customer_id = ?", current_customer.id)
  end




end