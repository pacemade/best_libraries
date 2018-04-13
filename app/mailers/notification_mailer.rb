class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.book_available_email.subject
  #
  def book_available_email(notification)
    @notification = notification
    @library = @notification.library
    @book = notification.book
    @user = notification.user

    mail to: @user.email, subject: "Book Available: #{@book.title}"
  end
end
