require 'rails_helper'

RSpec.describe WebAddressesController, type: :controller do

  context 'with render_views' do
    render_views

    describe 'GET index when No Web Addresses available' do
      it 'should have content like No Web Addresses created, please create one' do
        user = User.create(email: 'email@example.com', password: 'Welcome@123', password_confirmation: 'Welcome@123')
        sign_in user
        get :index
        expect(response.body).to match /No Web Addresses created, please create one/im
      end
    end

    describe 'GET index when Web Addresses available' do
      it 'should have content like No Web Addresses created, please create one' do
        user = User.create(email: 'email@example.com', password: 'Welcome@123', password_confirmation: 'Welcome@123')
        web_address = user.web_addresses.create(url: 'https://example.com')
        sign_in user
        get :index
        expect(response.body).to match /List of web addresses. Please do click to explore more/im
      end
    end

    describe 'WebAddress #generate' do
      context 'with invalid params' do
        it 'returns error message Url can&#39;t be blank on blank url' do
          @params = {web_address: {url: ''}}
          post :generate, params: @params, xhr: true
          expect(response.body).to match /Url can&#39;t be blank/im
        end

        it 'returns error message Url can&#39;t be blank on invalid url' do
          @params = {web_address: {url: 'dfndgjnfsdgb'}}
          post :generate, params: @params, xhr: true
          expect(response.body).to match /Url is not a valid HTTP URL/im
        end

        it 'returns error message Url can&#39;t be blank on blank url' do
          @params = {web_address: {url: 'https://google.com/search'}}
          post :generate, params: @params, xhr: true
          expect(response.body).to match />Here is your tiny url/im
        end

      end
    end


  end
end
