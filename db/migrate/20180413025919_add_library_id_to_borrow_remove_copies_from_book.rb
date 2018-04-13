class AddLibraryIdToBorrowRemoveCopiesFromBook < ActiveRecord::Migration[5.1]
  def up
    add_reference :borrows, :library, foreign_key: true
    remove_column :books, :copies
  end

  def down
    remove_reference :borrows, :library
    add_column :books, :copies, :integer
  end
end
