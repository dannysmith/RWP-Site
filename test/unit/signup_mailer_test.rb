require 'test_helper'

class SignupMailerTest < ActionMailer::TestCase
  test "confirm" do
    @expected.subject = 'SignupMailer#confirm'
    @expected.body    = read_fixture('confirm')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SignupMailer.create_confirm(@expected.date).encoded
  end

  test "sent" do
    @expected.subject = 'SignupMailer#sent'
    @expected.body    = read_fixture('sent')
    @expected.date    = Time.now

    assert_equal @expected.encoded, SignupMailer.create_sent(@expected.date).encoded
  end

end
