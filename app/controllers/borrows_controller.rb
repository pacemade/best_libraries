class BorrowsController < ApplicationController

  def create
    @borrow = Borrow.new
    @borrow.due_date = Time.now + 1.week
    @borrow.user = current_user
    @borrow.book = Book.find(params[:book_id])
    if @borrow.save
      redirect_to user_url(current_user), notice: "Book added!"
    end
  end

  def update
    # Nested route gives a book id for the params, need to figure out how to get params to list borrow_id instead
    # Probably an association problem
    @borrow = Borrow.find(params[:book_id])
    @borrow.update(borrow_status: "returned")
    # Timezone is UTC
    @borrow.update(date_returned: Time.now)
    redirect_to user_url(current_user), notice: "Book Returned!"
  end
  #
  # def borrow_params
  #   params.require(:borrow).permit(:user_id, :book_id)
  # end

end
