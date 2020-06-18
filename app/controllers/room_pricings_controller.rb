class RoomPricingsController < ApplicationController
  before_filter :set_title

  def index
    @room_pricings = RoomPricing.all
  end

  def new
    @btn_text = "Create"
    @room_pricing = RoomPricing.new
  end

  def create
    @room_pricing = RoomPricing.new(params[:room_pricing])
    if @room_pricing.save
      flash[:notice] = "Your new rate periods was saved successfully."
      redirect_to rate_periods_path
    else
      render 'room_pricings/new'
    end
  end

  def edit
    @btn_text = "Edit"
    @room_pricing = RoomPricing.find(params[:id])
  end

  # update method will archive the current rate period and create a new one
  # to keep the historic
  def update
    # @room_pricing = RoomPricing.find(params[:id])
    # @room_pricing.update( archived: true)
    # @room_pricing.archived = params[:room_pricing].archived
    #
    # if @room_pricing.update_attributes(params[:room_pricing])
    #   flash[:notice] = "Your settings were updated successfully."
    #   redirect_to rate_periods_path
    # else
    #   @btn_text = "Edit"
    #   render 'settings/edit'
    # end


  end

  private

  def set_title
    @title = "NCI Rate periods"
  end

end
