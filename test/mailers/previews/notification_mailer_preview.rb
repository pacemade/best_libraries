# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/book_available_email
  def book_available_email
    notification = Notification.last
    NotificationMailer.book_available_email(notification)
  end

end
