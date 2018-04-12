class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_secure_password

  validates :email, :first_name, :last_name, presence: true

  has_many :borrows
  has_many :books, through: :borrows, source: :book


end
