class RoomsController < ApplicationController

  def index
    @rooms = Room.order("floor ASC, number ASC")
  end

  def show
    @room = Room.find(params[:id])
    # initialisation du formulaire pour creation d'un room-pricing si inexistant
    @room_pricing = RoomPricing.new(room_type_id: @room.room_type_id,
                                    room_view_id: @room.room_view_id,
                                    date_from: Time.new.strftime("%Y-%m-%d").to_s)
    @room_types = RoomType.all
    @room_views = RoomView.all
  end

  def new
    @btn_text = "Create"
    @room = Room.new
    @room_types = RoomType.all
    @room_views = RoomView.all
  end

  def create

    @room = Room.new(params[:room])
    @room_pricing = RoomPricing.new(params[:room_pricing])

    binding.pry

    if @room_pricing.valid?
      @room_pricing.save
    end

    if @room.valid?
      @room.save
      flash[:notice] = "Your new room was created successfully."
      redirect_to rooms_path
    else
      @btn_text = "Create"
      @room_pricing = RoomPricing.new(room_type_id: @room.room_type_id,
                                      room_view_id: @room.room_view_id,
                                      date_from: Time.new.strftime("%Y-%m-%d").to_s)
      @room_types = RoomType.all
      @room_views = RoomView.all
      render 'new'
    end
  end

  def edit
    @room = Room.find(params[:id])
    @room_types = RoomType.all
    @room_views = RoomView.all
  end

end
