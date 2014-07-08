class AccountMailer < ActionMailer::Base
  default from: "michaelbyrdsemail@gmail.com"

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def email_confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
