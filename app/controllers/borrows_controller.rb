class BorrowsController < ApplicationController

  def create
    @borrow = Borrow.new
    @borrow.due_date = Time.now + 1.week
    @borrow.user = current_user
    @book = Book.find(params[:book_id])
    @borrow.book = @book
    @on_loan = @book.borrows.on_loan
    # checks to see if all are loaned
    if Borrow.book_available?(@book, @on_loan)
      @borrow.save
      redirect_to user_url(current_user), notice: "Book added!"
    else
      redirect_to request.referrer, notice: "All copies have been loaned, please check back later!"
    end
  end

  def update
    # Nested route gives a book id for the params, need to figure out how to get params to list borrow_id instead
    # Probably an association problem
    @borrow = Borrow.find(params[:book_id])
    @borrow.update(borrow_status: "returned")
    @borrow.update(date_returned: Time.now)
    redirect_to user_url(current_user), notice: "Book Returned!"
  end

end
