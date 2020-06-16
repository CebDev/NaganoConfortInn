class Setting < ActiveRecord::Base
  validates :company_name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :tps, presence: true
  validates :tvq, presence: true
end