class PagesController < ApplicationController
  def index
    @title = 'NaganoConforInn'
    @setting = Setting.first
    @room_types = RoomType.all
    @room_view = RoomView.all

  end



end
