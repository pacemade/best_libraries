class Book < ApplicationRecord
  require "csv"

  validates :title, :author, :genre, :subgenre, :pages, :publisher, :copies, presence: true

  has_many :borrows
  has_many :users, through: :borrows, source: :user

end
