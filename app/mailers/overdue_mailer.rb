class OverdueMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.overdue_mailer.overdue_book_email.subject
  #
  def overdue_book_email(borrow)
    @borrow = borrow
    @book = @borrow.book
    @user = @borrow.user

    mail to: @user.email, subject: "Book Overdue: #{@book.title}"
  end
end
