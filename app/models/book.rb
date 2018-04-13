class Book < ApplicationRecord
  require "csv"

  validates :title, :pages, presence: true

  has_many :borrows
  has_many :users, through: :borrows, source: :user
  has_many :libraries, through: :borrows, source: :library
  has_many :copies
  has_many :libraries, through: :copies, source: :library

end
