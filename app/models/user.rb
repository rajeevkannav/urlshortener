class User < ApplicationRecord

  ##### Devise available option ########
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  ##### Associations ###################
  has_many :web_addresses, inverse_of: :user, dependent: :destroy
  has_many :punches, through: :web_addresses

  has_secure_token :auth_token
end
