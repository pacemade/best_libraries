class BooksController < ApplicationController

  before_action :is_admin?, only: [:new, :edit, :update]

  def index
    @libraries = Library.all
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @on_loan = @book.borrows.on_loan
    @returns = @book.borrows.returns
    @libraries = @book.libraries
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
    if current_user.admin != true
      redirect_to books_url, notice: "You do not have permissions to do that!"
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :subgenre, :pages, :publisher)
  end

end
