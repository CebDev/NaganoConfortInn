class RatePeriod < ActiveRecord::Base

  validates :title, :date_from, :date_to, presence: true
  validates :date_from, :date_to, format: { with: /\d{4}\-\d{2}\-\d{2}/ }
  validates :over_rate_percentage, numericality: true, if: "over_rate_dollar.blank?"
  validates :over_rate_dollar, numericality: true, if: "over_rate_percentage.blank?"
  validate :dates_validation

  private

  def dates_validation
    return if date_from.blank? || date_to.blank?
    if date_to < date_from
      errors.add(:date_to, "must be after starting date.")
    end
  end

end
