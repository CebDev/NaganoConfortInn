class RoomType < ActiveRecord::Base
  has_many :room_pricings

end