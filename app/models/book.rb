class Book < ApplicationRecord
  require "csv"

  has_many :borrows
  has_many :users, through: :borrows

end
