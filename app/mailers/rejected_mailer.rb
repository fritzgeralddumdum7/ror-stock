class RejectedMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rejected_mailer.send_reject_mailer.subject
  #
  def send_reject_mailer
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
