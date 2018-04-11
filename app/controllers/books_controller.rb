class BooksController < ApplicationController

  before_action :is_admin?, only: [:new, :edit, :update]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @on_loan = @book.borrows.where("borrow_status = ?", "on_loan")
    @returns = @book.borrows.where("borrow_status = ?", "returned")
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_url, notice: "Book created!"
    else
      flash.now[:alert] = @book.errors.full_messages
      render "new"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to books_url(@book)
    else
      render "edit"
    end
  end

  def is_admin?
    if current_user.kind != "admin"
      redirect_to books_url, notice: "You do not have permissions to do that!"
    end
  end

  def book_params
    params.require(:book).permit(:title, :author, :genre, :subgenre, :pages, :publisher, :copies)
  end
end
