class Administration::RoomsController < ApplicationController

  layout "administration"

  before_filter :set_title
  before_filter :get_all_room_types, :get_all_room_views, only: [:show, :new, :create, :edit, :update]

  def index
    @rooms = Room.order("floor ASC, number ASC")
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @btn_text = "Create"
    @room = Room.new
    @room_picture = RoomPicture.new
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
      redirect_to edit_administration_room_path(@room)
    else
      @btn_text = "Create"
      @room_pricing = RoomPricing.new(room_type_id: @room.room_type_id,
                                      room_view_id: @room.room_view_id,
                                      date_from: Time.new.strftime("%Y-%m-%d").to_s)
      render 'new'
    end
  end

  def edit
    @btn_text = "Save"
    @room = Room.find(params[:id])
    @room_picture = RoomPicture.new(params[:room_picture])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(params[:room])
      flash[:notice] = "Room was updated successfully."
      redirect_to edit_administration_room_path(@room)
    else
      @room_picture = RoomPicture.new(params[:room_picture])
      @btn_text = "Save"
      render 'edit'
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
