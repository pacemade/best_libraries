class Notification < ApplicationRecord

  belongs_to :book
  belongs_to :library
  belongs_to :user

  scope :unsent_notifications, -> { where(notified: false) }

end
