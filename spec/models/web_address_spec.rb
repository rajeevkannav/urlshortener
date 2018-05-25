require 'rails_helper'

RSpec.describe WebAddress, type: :model do

  describe 'Validations' do
    it {should validate_presence_of :url}
  end

  describe 'Associations' do
    it {should have_many :punches}
    it {should belong_to :user}
  end

  context 'Generate tiny-url' do
    describe 'token uniqueness' do
      it 'should generate token unique' do
        WebAddress.destroy_all
        10000.times do |i|
          WebAddress.create(url: "https://example#{i}.com")
        end
        expect(10000).to eq(WebAddress.select(:tiny_url).uniq.count)
      end

      it 'should not allow common token ' do
        web_1 = WebAddress.create(url: "https://example.com", tiny_url: 'common')
        web_1.save
        web_2 = WebAddress.create(url: "https://example.com", tiny_url: 'common')
        web_3 = WebAddress.create(url: "https://example.com", tiny_url: 'common')
        web_4 = WebAddress.create(url: "https://example.com", tiny_url: 'common')
        web_5 = WebAddress.create(url: "https://example.com", tiny_url: 'common')
        expect("has already been taken").to match web_2.errors[:tiny_url][0]
        expect("has already been taken").to match web_3.errors[:tiny_url][0]
        expect("has already been taken").to match web_4.errors[:tiny_url][0]
        expect("has already been taken").to match web_5.errors[:tiny_url][0]
      end

    end

  end

end
