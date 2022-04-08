class RejectedMailer < ApplicationMailer

    def send_reject_email(user)
        @user = user
        mail to: @user.email, subject: "Registration to Stock Overflow has been Rejected", from: "admin@gmail.com"
    end

end