# require 'csv'
#
# csv_text = File.read("pt1.csv")
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   Book.create!(row.to_hash)
# end

# desc "Import part 1 books from csv"
# task books: :environment do
#   filename = File.join Rails.root, "pt1.csv"
#   CSV.foreach(filename) do |row|
#     p row
#   end
# end
