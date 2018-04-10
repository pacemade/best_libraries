class AddIndexesToBorrows < ActiveRecord::Migration[5.1]
  def up
    add_index :borrows, :user_id
    add_index :borrows, :book_id
  end
  
  def down
    remove_index :borrows, :user_id
    remove_index :borrows, :book_id
  end
end
