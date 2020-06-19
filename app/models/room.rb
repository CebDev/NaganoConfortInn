class Room < ActiveRecord::Base
  belongs_to :room_type
  belongs_to :room_view

end