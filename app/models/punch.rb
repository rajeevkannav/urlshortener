class Punch < ApplicationRecord

  #==== Validations ===================================
  validates :ip_address, presence: true
  validates :request_object, presence: true
  validates :user_agent, presence: true
  validates :platform, presence: true
  validates :browser, presence: true
  validates :user_agent_metadata, presence: true

  ##### Associations ###################
  belongs_to :web_address, inverse_of: :punches
end
