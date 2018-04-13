class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.boolean :notified, default: false

      t.timestamps
    end
  end
end
