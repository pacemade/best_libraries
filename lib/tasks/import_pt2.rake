require 'csv'

desc "Import part 2 books from csv"
task import_libraries_books: :environment do
  filename = File.join Rails.root, "pt2.csv"
  CSV.foreach(filename) do |row|
    library = Library.create!(library_name: row[0])
    book = Book.create!(title: row[1], author: row[2], genre: row[3], subgenre: row[4], pages: row[5], publisher: row[6])
  #   copy = Copy.new(copies: row[7])
  #   copy.library = library
  #   copy.book = book
  #   copy.save
  end
end
