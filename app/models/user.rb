class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ##### Associations ###################
  has_many :web_addresses, inverse_of: :user
  has_many :punches, through: :web_addresses
end
