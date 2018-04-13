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
    # Nested route gives a user id for the params, need to figure out how to get params to list notification_id instead
    @notification = Notification.find(params[:user_id])
    @notification.update(:notified => true)
    # check for notifications
    redirect_to user_url(current_user), notice: "Notification deleted!"
  end

  # def destroy
  #   @notification = Notification.find(params[:notification_id])
  #   if @notification.destroy
  #     redirect_to user_url(current_user), notice: "Notification deleted!"
  #   end
  # end

end
