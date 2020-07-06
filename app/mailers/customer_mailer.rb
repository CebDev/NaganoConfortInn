class CustomerMailer < ActionMailer::Base
  default from: "sebastien.vermandele@semiweb.ca"

  def welcome_email(customer)
    @customer = customer
    mail(to: customer.email, subject: 'Test mail')
  end
end
