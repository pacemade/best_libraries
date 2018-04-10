class CreateBorrows < ActiveRecord::Migration[5.1]
  def change
    create_table :borrows do |t|
      t.datetime :due_date

      t.timestamps
    end
  end
end
