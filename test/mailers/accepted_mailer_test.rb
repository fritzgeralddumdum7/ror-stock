require "test_helper"

class AcceptedMailerTest < ActionMailer::TestCase
  test "send_acceptance_letter" do
    mail = AcceptedMailer.send_acceptance_letter
    assert_equal "Send acceptance letter", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
