require "test_helper"

class RejectedMailerTest < ActionMailer::TestCase
  test "send_reject_mailer" do
    mail = RejectedMailer.send_reject_mailer
    assert_equal "Send reject mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
