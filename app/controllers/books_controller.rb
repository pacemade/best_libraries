class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @on_loan = @book.borrows.where("borrow_status = ?", "on_loan")
  end


end
