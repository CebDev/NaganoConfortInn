class RoomPricing < ActiveRecord::Base
  belongs_to :room_type
  belongs_to :room_view

  validates :title, :date_from, :date_to, :price_open_day, :price_week_end, presence: true
  validates :price_open_day, :price_week_end, numericality: true
  validate :dates_validation

  private

  def dates_validation
    return if date_from.blank? || date_to.blank?
    if date_to < date_from
      errors.add(:date_to, "must be after starting date.")
    end
  end

end
