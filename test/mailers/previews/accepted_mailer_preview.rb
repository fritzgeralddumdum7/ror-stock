# Preview all emails at http://localhost:3000/rails/mailers/accepted_mailer
class AcceptedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/accepted_mailer/send_acceptance_letter
  def send_acceptance_letter
    AcceptedMailer.send_acceptance_letter
  end

end
