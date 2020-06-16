class Setting < ActiveRecord::Base
  validates :company_name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true, :format => { :with => /^(?!.*[DFIOQU])[A-VXY][0-9][A-Z] ?[0-9][A-Z][0-9]$/ ,
                                                    :message => " is invalid. Please use \"A1A 1AA\" format."}
  validates :city, presence: true
  validates :country, presence: true
  validates :phone_number, presence: true, :format => { :with => /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/ ,
                                                        :message => " is invalid."}
  validates :email, presence: true, :format => { :with => /^(.+)@(.+)$/ ,
                                                :message => " is invalid."}
  validates :tps, presence: true, :numericality => true
  validates :tvq, presence: true, :numericality => true
end