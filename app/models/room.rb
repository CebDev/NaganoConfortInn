class Room < ActiveRecord::Base
  belongs_to :room_type, class_name: RoomType
  belongs_to :room_view, class_name: RoomView
  has_many :reservation_rooms
  has_many :room_pictures
  has_many :room_adjacents

  validates :number, uniqueness: true
  validates :number, :floor, presence: true
  validates :capacity, presence: true, numericality: true
  validate :room_pricing_exist

  def get_first_picture
    if room_pictures.empty?
      "room_double_ocean.jpeg"
    else
      room_pictures.first.file_name
    end
  end

  def room_pricing_exist
    if RoomPricing
           .where("date_from <= DATE('now') AND date_to >= DATE('now')")
           .where(room_view_id: room_view_id, room_type_id: room_type_id, archived_at: nil)
           .length == 0
      errors.add("Room pricing", "is not set")
    end
  end

  # retourne la liste de l'ensemble des pricings associes
  def get_room_pricings
    RoomPricing.where(room_view_id: room_view_id,
                      room_type_id: room_type_id,
                      archived_at: nil)
  end

  # retourne la liste de l'ensemble des pricings associes a une date
  def get_room_pricing_on_date(date)
    self.get_room_pricings.where("date_from <= DATE('#{date}') AND date_to >= DATE('#{date}')")
  end

  def get_price_per_nigth(date)
    self.get_room_pricing_on_date(date).each do |room_pricing|
      if date.to_date.saturday? || date.to_date.sunday?
        return room_pricing.price_week_end.to_f
      end
      return room_pricing.price_open_day.to_f
    end
  end

  def get_price_per_stay(date_from, date_to)
    total_price = 0.0
    ((date_from.to_date)...(date_to.to_date)).each do |date|
      night_price = get_price_per_nigth(date)
      total_price += night_price
    end
    total_price
  end

  def is_check_in_today?
    if ReservationRoom.where("room_id = ?", id).where("date_from = ?", Time.new.strftime("%Y-%m-%d").to_s).empty?
      return false
    end
    true
  end

  def is_check_out_today?
    if ReservationRoom.where("room_id = ?", id).where("date_to = ?", Time.new.strftime("%Y-%m-%d").to_s).empty?
      return false
    end
    true
  end

  def room_pricing_to_archived
    room.archived_at = Time.now.to_i
    room.save
  end

end