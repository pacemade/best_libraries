class AddBooksLibrariesToCopy < ActiveRecord::Migration[5.1]
  def up
    add_reference :copies, :book, foreign_key: true
    add_reference :copies, :library, foreign_key: true
  end

  def down
    remove_reference :copies, :book
    remove_reference :copies, :library
  end
end
