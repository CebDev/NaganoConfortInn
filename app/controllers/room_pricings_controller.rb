class RoomPricingsController < ApplicationController
  before_filter :set_title

  def index
    @room_pricings = RoomPricing.order("date_from DESC")
  end

  def show
    @room_pricing = RoomPricing.find(params[:id])
    @room_type = RoomType.find(@room_pricing.room_type_id)
    @room_view = RoomView.find(@room_pricing.room_view_id)
    @rooms = Room.where(room_type_id: @room_pricing.room_type_id, room_view_id: @room_pricing.room_view_id).order("number ASC")
  end

  def new
    @btn_text = "Create"
    @room_pricing = RoomPricing.new
    @room_types = RoomType.all
    @room_views = RoomView.all
  end


  def create
    @room_pricing = RoomPricing.new(params[:room_pricing])
    if @room_pricing.save
      flash[:notice] = "Your new rate periods was saved successfully."
      redirect_to room_pricings_path
    else
      @room_pricing = RoomPricing.new(params[:room_pricing])
      @room_types = RoomType.all
      @room_views = RoomView.all
      render 'room_pricing/new'
    end
  end

  def edit
    @btn_text = "Edit"
    @room_pricing = RoomPricing.find(params[:id])
    @room_types = RoomType.all
    @room_views = RoomView.all
  end

  private

  def set_title
    @title = "NCI Room settings"
  end

end
