class Administration::RoomViewsController < ApplicationController

  def create
    @room_view = RoomView.new(params[:room_view])
    if @room_view.save
      flash[:notice] = "New room view saved successfully."
      redirect_to administration_room_types_path
    else
      @room_type = RoomType.new
      @room_types = RoomType.all
      @room_views = RoomView.all
      render 'administration/room_types/index'
    end
  end

end
