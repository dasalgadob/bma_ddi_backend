class User < ApplicationRecord
  validates :password_confirmation, presence: true, on: :create
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  include DeviseTokenAuth::Concerns::User         

  has_many :interviews
  has_many :results       


  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml
      
    super && !self.is_disabled
  end
end
