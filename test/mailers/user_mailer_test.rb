require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    body = mail.body.decoded.force_encoding('UTF-8').encode('UTF-8')
    #assert_match user.name,               mail.body.encoded
    #assert_match user.name,               body
    #assert_match user.activation_token,   mail.body.encoded
    #assert_match CGI::escape(user.email), mail.body.encoded
  end
end
