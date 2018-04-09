class User < ApplicationRecord
  has_secure_password

  validates :email, :first_name, :last_name, presence: true

  has_many :books, through: :borrows
  has_many :borrows

end
