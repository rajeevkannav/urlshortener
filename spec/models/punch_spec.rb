require 'rails_helper'

RSpec.describe Punch, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :ip_address}
    it {should validate_presence_of :request_object}
  end

  describe 'Associations' do
    it {should belong_to :web_address}
  end

end
