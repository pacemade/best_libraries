class BorrowsController < ApplicationController
  before_action :authenticate_user!


  def create
    @borrow = Borrow.new
    @borrow.due_date = Time.now + 1.week
    @borrow.user = current_user
    @book = Book.find(params[:book_id])
    @borrow.book = @book
    @library = Library.find(params[:library_id])
    @borrow.library = @library
    # checks to see if all are loaned
    if Borrow.book_available?(@book, @library)
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

    @notifications = @borrow.book.notifications.unsent_notifications
    Notification.notification_mailer(@notifications)
    redirect_to user_url(current_user), notice: "Book Returned!"
  end

end
