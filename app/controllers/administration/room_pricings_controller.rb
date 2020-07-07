class Administration::RoomPricingsController < ApplicationController

  layout "administration"

  before_filter :set_title
  before_filter :get_all_room_types, :get_all_room_views, only: [:new, :create, :edit, :update]

  def index
    @room_pricings = RoomPricing.order("date_from DESC")
  end

  def show
    @room_pricing = RoomPricing.find(params[:id])
    @rooms = @room_pricing.get_matching_rooms.order("number ASC")
  end

  def new
    @btn_text = "Create"
    @room_pricing = RoomPricing.new
  end


  def create
    @room_pricing = RoomPricing.new(params[:room_pricing])
    if @room_pricing.save
      flash[:notice] = "Your new rate periods was saved successfully."
      redirect_to administration_room_pricings_path
    else
      render 'new'
    end
  end

  def edit
    @room_pricing = RoomPricing.find(params[:id])
    # A revoir Ajouter romm pricing dans reservation_room
    if @room_pricing.reservation_rooms.empty?
      @btn_text = "Can't edit"
    else
      @btn_text = "Edit"
    end

  end

  def update
    @room_pricing = RoomPricing.find(params[:id])
    if @room_pricing.update_attributes(params[:room_pricing])
      flash[:notice] = "Room pricing was updated successfully."
      redirect_to administration_room_pricings_path
    else
      @btn_text = "Edit"
      render 'administration/room_pricings/edit'
    end
  end

  private

  def set_title
    @title = "NCI Room settings"
  end

  def get_all_room_types
    @room_types = RoomType.all
  end

  def get_all_room_views
    @room_views = RoomView.all
  end

end
