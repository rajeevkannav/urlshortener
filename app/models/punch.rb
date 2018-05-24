class Punch < ApplicationRecord

  #==== Validations ===================================
  validates :ip_address, presence: true
  validates :request_object, presence: true

  ##### Associations ###################
  belongs_to :web_address, inverse_of: :punches
end
