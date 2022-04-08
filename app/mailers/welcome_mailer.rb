class WelcomeMailer < ApplicationMailer

    def send_welcome_email(user)
        @user = user
        mail to: @user.email, subject: "Welcome to Stock App", from: "adminr@gmail.com"
    end

end