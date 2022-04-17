# Preview all emails at http://localhost:3000/rails/mailers/rejected_mailer
class RejectedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/rejected_mailer/send_reject_mailer
  def send_reject_mailer
    RejectedMailer.send_reject_mailer
  end

end
