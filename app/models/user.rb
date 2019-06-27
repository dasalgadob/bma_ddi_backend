class User < ApplicationRecord
  validates :password_confirmation, presence: true, on: :create
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :interviews
  has_many :results       
end
