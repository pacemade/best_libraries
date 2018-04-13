class Borrow < ApplicationRecord

  belongs_to :user
  belongs_to :book
  belongs_to :library

  scope :on_loan, -> { where(borrow_status: "on_loan") }
  scope :returns, -> { where(borrow_status: "returned") }

  def self.book_available?(book, library)
    copies = Borrow.copies_available(book, library)
    on_loan = Borrow.on_loan_count(book, library)
    copies - on_loan >= 1
  end

  def self.on_loan_count(book, library)
    Borrow.where("library_id = ?", library.id).where("book_id = ?", book.id).on_loan.count
  end

  def self.copies_available(book, library)
    Copy.where("library_id = ?", library.id).where("book_id = ?", book.id).first.copies
  end



end
