class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  validates :email, :first_name, :last_name, presence: true

  has_many :notifications
  has_many :borrows
  has_many :books, through: :borrows, source: :book


end
