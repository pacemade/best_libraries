class AddBorrowStatusColumnToBorrows < ActiveRecord::Migration[5.1]
  def change
    add_column :borrows, :borrow_status, :string, :default => "on_loan"
    add_column :borrows, :date_returned, :datetime
  end
end
