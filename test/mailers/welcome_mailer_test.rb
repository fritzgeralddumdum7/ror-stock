require "test_helper"

class WelcomeMailerTest < ActionMailer::TestCase
  test "welcome_mailer" do
    mail = WelcomeMailer.welcome_mailer
    assert_equal "Welcome mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
