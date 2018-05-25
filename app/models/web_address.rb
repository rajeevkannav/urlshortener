class WebAddress < ApplicationRecord

  ##### Validations ####################
  validates :url, presence: true, http_url: true
  validates :tiny_url, presence: true, uniqueness: true

  ##### Associations ###################
  belongs_to :user, optional: true
  has_many :punches, inverse_of: :web_address, dependent: :destroy

  ##### Callbacks ######################
  before_validation :generate_tiny_url_token, :if => Proc.new {|w_a| w_a.tiny_url.nil?}


  private

  # 2.4.1 :001 > a = []
  # => []
  # 2.4.1 :002 > 10.times{ Thread.new { 1000000.times{a <<  SecureRandom.urlsafe_base64(6, false) } } }
  # => 10
  # 2.4.1 :003 > a.size
  # => 1226822
  # 2.4.1 :004 > a.size
  # => 3206148
  # 2.4.1 :005 > a.size
  # => 10000000
  # 2.4.1 :006 > a.uniq.size
  # => 10000000
  
  def generate_tiny_url_token
    self.tiny_url = SecureRandom.urlsafe_base64(4.5, false)
  end
end
