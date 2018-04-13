class LibrariesController < ApplicationController

  def show
    @library = Library.find(params[:id])
    @books = @library.books
  end

end
