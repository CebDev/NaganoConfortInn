class RoomTypesController < ApplicationController

  def index
    @room_types = RoomType.all
    @room_views = RoomView.all
    @room_type = RoomType.new
    @room_view = RoomView.new
  end

  def show
  end

  def create
    @room_type = RoomType.new(params[:room_type])
    if @room_type.save
      flash[:notice] = "New room type saved successfully."
      redirect_to room_types_path
    else
      @room_view = RoomView.new
      @room_types = RoomType.all
      @room_views = RoomView.all
      render 'room_types/index'
    end
  end


end
