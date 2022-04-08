class AcceptedMailer < ApplicationMailer

    def send_acceptance_email(user)
        @user = user
        mail to: @user.email, subject: "Registration to Stock App has been Accepted", from: "admin@gmail.com"
    end

end