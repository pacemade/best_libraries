class AddIndexToNotifications < ActiveRecord::Migration[5.1]
  def up
    add_reference :notifications, :book, foreign_key: true
    add_reference :notifications, :library, foreign_key: true
    add_reference :notifications, :user, foreign_key: true
  end

  def down
    remove_reference :notifications, :book, foreign_key: true
    remove_reference :notifications, :library, foreign_key: true
    remove_reference :notifications, :user, foreign_key: true
  end
end
