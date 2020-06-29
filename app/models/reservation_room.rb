class ReservationRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :room_pricing
  belongs_to :reservation

  validates :reservation_id, :room_id, :room_pricing_id, presence: true, numericality: true

  def get_price_per_stay
    date = date_from
    total_price = 0.0
    while date <= date_to
      night_price = self.room.get_price_per_nigth(date)
      total_price += night_price
      date += 1
    end
    total_price.to_f
  end

end