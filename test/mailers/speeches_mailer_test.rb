require 'test_helper'

class SpeechesMailerTest < ActionMailer::TestCase
  test "share" do
    mail = SpeechesMailer.share
    assert_equal "Share", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
