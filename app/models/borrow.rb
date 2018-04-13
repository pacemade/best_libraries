class Borrow < ApplicationRecord

  belongs_to :user
  belongs_to :book
  belongs_to :library

  scope :on_loan, -> { where(borrow_status: "on_loan") }
  scope :returns, -> { where(borrow_status: "returned") }

  def self.book_available?(book, library, on_loan)
    copies = Copy.where("library_id = ?", library.id).where("book_id = ?", book.id).first.copies 
  end


end
