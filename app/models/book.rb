class Book < ApplicationRecord
  require "csv"

  has_many :users, through: :borrows
  has_many :borrows

end
