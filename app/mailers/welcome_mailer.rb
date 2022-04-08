class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.welcome_mailer.subject
  #
  def welcome_mailer(user)
    @user = user
    mail to: @user.email, subject: "Welcome to Stock App", from: "admin@gmail.com"
  end
end