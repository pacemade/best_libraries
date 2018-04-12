require 'test_helper'

class OverdueMailerTest < ActionMailer::TestCase
  test "overdue_book_email" do
    mail = OverdueMailer.overdue_book_email
    assert_equal "Overdue book email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
