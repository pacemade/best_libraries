require 'csv'

desc "Import part 2 books from csv"
task import_libraries_books: :environment do
  Book.destroy_all
  filename = File.join Rails.root, "pt2.csv"
  CSV.foreach(filename) do |row|
    b = Book.new(title: row[0], author: row[1], genre: row[2], subgenre: row[3], pages: row[4], publisher: row[5], copies: row[6])
  end
  Book.first.destroy
  # best way to ignore header row for now
end
