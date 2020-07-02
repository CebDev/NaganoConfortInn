class Reservation < ActiveRecord::Base
  belongs_to :customer
  has_many :reservation_rooms

end