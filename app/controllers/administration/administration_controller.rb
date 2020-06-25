class Administration::AdministrationController < ApplicationController
  layout "administration"

  def index
    @title = 'NCI administration'
    @nbr_total_room = Room.all.length
    @nbr_room_checked_in = Room.where(status: "Busy").length
  end

end
