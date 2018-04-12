class Book < ApplicationRecord
  require "csv"

  validates :title, :pages, :copies, presence: true

  has_many :borrows
  has_many :users, through: :borrows, source: :user

end
