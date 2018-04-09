require 'csv'

desc "Import part 1 books from csv"
task import_books: :environment do
  Book.destroy_all
  filename = File.join Rails.root, "pt1.csv"
  CSV.foreach(filename) do |row|
    p row
    Book.create!(title: row[0], author: row[1], genre: row[2], subgenre: row[3], pages: row[4], publisher: row[5], copies: row[6])
  end
end
