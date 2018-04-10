class AddReferenceColumns < ActiveRecord::Migration[5.1]
  def up
    add_reference :borrows, :book, foreign_key: true
    add_reference :borrows, :user, foreign_key: true
  end

  def down
    remove_reference :borrows, :book
    remove_reference :borrows, :user
  end
end
