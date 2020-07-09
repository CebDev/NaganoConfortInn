class ReservationRoom < ActiveRecord::Base
  belongs_to :room
  belongs_to :reservation
  belongs_to :room_pricing

  validates :reservation_id, :room_id, presence: true, numericality: true

  scope :start_today, ->{ where(date_from: Date.today) }
  scope :stop_today, ->{ where(date_to: Date.today) }

  def get_price_per_stay
    date = date_from
    total_price = 0.0
    while date <= date_to
      night_price = self.room.get_price_per_night(date)
      total_price += night_price
      date += 1
    end
    total_price.to_f
  end

end