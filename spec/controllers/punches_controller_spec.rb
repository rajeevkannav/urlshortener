require 'rails_helper'

RSpec.describe PunchesController, type: :controller do

  context 'with render_views' do
    render_views

    describe 'GET Punch with invalid Token' do
      it 'should have redirect to root_url without creating Punch Record' do
        @params = {token: 'hdgffsdahdgffsda'}
        get :punch, params: @params
        expect(response).to redirect_to(root_path)
        expect(response).to have_http_status(302)
      end
    end

    describe 'GET Punch with invalid Token' do
      it 'should have redirect to root_url without creating Punch Record' do
        web_address = WebAddress.create(url: 'https://google.com')
        @punch_count = web_address.punches.count
        @params = {token: web_address.tiny_url}
        get :punch, params: @params
        expect(response).to redirect_to(web_address.url)
        expect(response).to have_http_status(302)
        web_address.reload
        expect(web_address.punches.count).to eq(@punch_count+1)
      end
    end

  end

end
