require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "book_available_email" do
    mail = NotificationMailer.book_available_email
    assert_equal "Book available email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
