class Book < ApplicationRecord
  require "csv"

  has_many :users

end
