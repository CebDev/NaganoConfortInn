class RoomAdjacent < ActiveRecord::Base
  belongs_to :room
  has_many :rooms

end