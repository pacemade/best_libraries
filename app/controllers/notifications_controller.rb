class NotificationsController < ApplicationController

  before_action :authenticate_user!

  def create
    @notification = Notification.new
    @notification.user = current_user
    @book = Book.find(params[:book_id])
    @notification.book = @book
    @library = Library.find(params[:library_id])
    @notification.library = @library
    # checks to see if all are loaned
    if @notification.save
      redirect_to user_url(current_user), notice: "Notification Added!"
    end
  end

  def update
    # Nested route gives a book id for the params, need to figure out how to get params to list borrow_id instead
    # Probably an association problem
    @borrow = Borrow.find(params[:book_id])
    @borrow.update(borrow_status: "returned")
    @borrow.update(date_returned: Time.now)
    # check for notifications
    redirect_to user_url(current_user), notice: "Book Returned!"
  end
end
