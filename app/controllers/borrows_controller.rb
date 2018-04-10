class BorrowsController < ApplicationController

  def create
    @borrow = Borrow.new
    @borrow.due_date = Time.now + 1.week
    @borrow.user_id = current_user
    @borrow.book_id = Book.find(params[:book_id])
    if @borrow.save
      redirect_to user_url(current_user), notice: "Book added!"
    end
  end

  def destroy
  end
  #
  # def borrow_params
  #   params.require(:borrow).permit(:user_id, :book_id)
  # end

end
