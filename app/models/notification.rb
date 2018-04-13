class Notification < ApplicationRecord

  belongs_to :book
  belongs_to :library
  belongs_to :user

  scope :unsent_notifications, -> { where(notified: false) }

  def self.notification_mailer(notifications)
    notifications.each do |notification|
      NotificationMailer.book_available_email(notification).deliver
    end
  end

end
