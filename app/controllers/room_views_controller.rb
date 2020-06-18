class RoomViewsController < ApplicationController

  def create
    @room_view = RoomView.new(params[:room_view])
    if @room_view.save
      flash[:notice] = "New room view saved successfully."
      redirect_to room_types_path
    else
      @room_type = RoomType.new
      @room_types = RoomType.all
      @room_views = RoomView.all
      render 'room_types/index'
    end
  end

end
