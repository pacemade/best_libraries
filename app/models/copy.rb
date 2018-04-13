class Copy < ApplicationRecord

  belongs_to :book
  belongs_to :library

  def self.copies_access(book, libraries)
    copies = []
    libraries.each do |library|
      copy = Copy.where("library_id = ?", library.id).where("book_id = ?", book.id).first
      copies << copy
    end
    return copies
  end

end
