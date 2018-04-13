class Book < ApplicationRecord
  require "csv"

  validates :title, :pages, presence: true

  has_many :notifications
  has_many :borrows
  has_many :users, through: :borrows, source: :user
  has_many :libraries, through: :borrows, source: :library
  has_many :copies
  has_many :libraries, through: :copies, source: :library

  def self.search(search)
    if search
      where(["title ILIKE ?","%#{search}%"])
    else
      all
    end
  end

end
