class Library < ApplicationRecord

  has_many :borrows
  has_many :copies
  has_many :books, through: :borrows, source: :book
  has_many :books, through: :copies, source: :book

end
