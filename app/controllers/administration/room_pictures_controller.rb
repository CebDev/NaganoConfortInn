class Administration::RoomPicturesController < ApplicationController

  layout "administration"

  def create
    @room_picture = RoomPicture.new(params[:room_picture])
    if @room_picture.save
      redirect_to edit_administration_room_path(@room_picture.room_id)
    else
      redirect_to edit_administration_room_path(@room_picture.room_id)
    end
  end

end