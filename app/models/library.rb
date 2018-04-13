class Library < ApplicationRecord

  has_many :borrows
  has_many :books, through: :borrows, source: :book
end
