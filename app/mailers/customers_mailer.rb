class CustomersMailer < ActionMailer::Base
  default from: "administration@naganoconfortinn.com"
  layout 'mailer'

  def reservation_confirmation(reservation)
    @reservation = reservation
    mail(to: @reservation.customer.email, subject: "Your new reservation # #{@reservation.id}")
  end

end
