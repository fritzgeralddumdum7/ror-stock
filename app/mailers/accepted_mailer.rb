class AcceptedMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.accepted_mailer.send_acceptance_letter.subject
  #
  def send_acceptance_letter
    @user = user
    mail to: @user.email, subject: "Registration to Stock App has been Accepted", from: "admin@admin.com"
  end
end
