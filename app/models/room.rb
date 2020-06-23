class Room < ActiveRecord::Base
  belongs_to :room_type, class_name: RoomType
  belongs_to :room_view, class_name: RoomView

  validates :number, uniqueness: true
  validates :number, :floor, presence: true
  validates :capacity, presence: true, numericality: true
  validate :room_pricing_exist

  def room_pricing_exist
    if RoomPricing
           .where("date_from <= DATE('now') AND date_to >= DATE('now')")
           .where(room_view_id: room_view_id, room_type_id: room_type_id, archived_at: nil)
           .length == 0
      errors.add("Room pricing", "is not set")
    end
  end

  def room_pricing_to_archived
    room.archived_at = Time.now.to_i
    room.save
  end

end