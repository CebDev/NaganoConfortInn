class Administration::RoomsController < ApplicationController

  layout "administration"

  before_filter :set_title
  before_filter :get_all_room_types, :get_all_room_views, only: [:show, :new, :create, :edit, :update]

  def index
    @rooms = Room.order("floor ASC, number ASC")
  end

  def show
    @room = Room.find(params[:id])
    # initialisation du formulaire pour creation d'un room-pricing si inexistant
    @room_pricing = RoomPricing.new(room_type_id: @room.room_type_id,
                                    room_view_id: @room.room_view_id,
                                    date_from: Time.new.strftime("%Y-%m-%d").to_s)
  end

  def new
    @btn_text = "Create"
    @room = Room.new
  end

  def create
    @room = Room.new(params[:room])
    @room_pricing = RoomPricing.new(params[:room_pricing])

    if @room_pricing.valid?
      @room_pricing.save
    end

    if @room.valid?
      @room.save
      flash[:notice] = "Your new room was created successfully."
      redirect_to administration_room_path
    else
      @btn_text = "Create"
      @room_pricing = RoomPricing.new(room_type_id: @room.room_type_id,
                                      room_view_id: @room.room_view_id,
                                      date_from: Time.new.strftime("%Y-%m-%d").to_s)
      render 'new'
    end
  end

  def edit
    @room = Room.find(params[:id])
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
