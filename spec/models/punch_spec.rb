require 'rails_helper'

RSpec.describe Punch, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :ip_address}
    it {should validate_presence_of :request_object}
    it {should validate_presence_of :user_agent}
    it {should validate_presence_of :platform}
    it {should validate_presence_of :browser}
    it {should validate_presence_of :user_agent_metadata}
  end

  describe 'Associations' do
    it {should belong_to :web_address}
  end

end
