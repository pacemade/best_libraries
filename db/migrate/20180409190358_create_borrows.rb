class CreateBorrows < ActiveRecord::Migration[5.1]
  def change
    create_table :borrows do |t|
      t.integer :user_id
      t.integer :book_id
      t.datetime :due_date

      t.timestamps
    end
  end
end
