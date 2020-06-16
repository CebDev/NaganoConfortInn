module RatePeriodsHelper

  def class_from_value (*values)
    values.each do |value|
      if value
        return value <= 0 ? 'green' : 'red'
      end
    end
  end
  
end
