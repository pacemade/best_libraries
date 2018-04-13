class Borrow < ApplicationRecord

  belongs_to :user
  belongs_to :book
  belongs_to :library

  scope :on_loan, -> { where(borrow_status: "on_loan") }
  scope :returns, -> { where(borrow_status: "returned") }

  def self.book_available?(book, on_loan)
    book.copies - on_loan.count >= 1
  end


end
