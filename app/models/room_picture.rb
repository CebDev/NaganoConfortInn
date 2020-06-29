class RoomPicture < ActiveRecord::Base
  belongs_to :room

  validates :file_name, presence: true, uniqueness: true

end