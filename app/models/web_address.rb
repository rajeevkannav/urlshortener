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

  # 2.4.1 :011 > a = []
  # => []
  # 2.4.1 :012 > 10000000.times{a <<  SecureRandom.urlsafe_base64(6, false) }
  # => 10000000
  # 2.4.1 :013 > a.size
  # => 10000000
  # 2.4.1 :014 > a.uniq.size
  # => 10000000
  # 2.4.1 :015 >

  def generate_tiny_url_token
    self.tiny_url = SecureRandom.urlsafe_base64(4.5, false)
  end
end
