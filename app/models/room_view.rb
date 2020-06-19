class RoomView < ActiveRecord::Base
  has_many :room_pricings
  has_many :rooms

  validates :title, presence: true
  validates :title, uniqueness: {case_sensitive: false}

end