class Customer < ActiveRecord::Base
  has_many :reservations

  validates :name, :first_name, presence: true
  validates :address, presence: true
  validates :zip_code, presence: true, :format => { :with => /^(?!.*[DFIOQU])[A-VXY][0-9][A-Z] ?[0-9][A-Z][0-9]$/ ,
                                                    :message => " is invalid. Please use \"A1A 1AA\" format."}
  validates :city, presence: true
  validates :country, presence: true
  validates :phone_number, presence: true, :format => { :with => /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/ ,
                                                        :message => " is invalid."}
  validates :email, presence: true, :format => { :with => /^(.+)@(.+)$/ ,
                                                 :message => " is invalid."}


  def self.search(search)
    if search
      customers = Customer.find_all_by_name(search)
    else
      Customer.order("name ASC")
    end
  end

end