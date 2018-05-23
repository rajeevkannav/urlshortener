require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  context 'GET index' do
    it 'renders the :index template' do
      expect(get: root_url).to route_to(controller: 'home', action: 'index')
      expect(response).to have_http_status(:success) # 200
    end
  end

  context 'with render_views' do
    render_views

    describe 'GET index' do
      it 'should have welcome message' do
        get :index
        expect(response.body).to match /Welcome/im
      end
    end

    describe 'GET index without current user' do
      it 'should have Sign up and Login links' do
        get :index
        expect(response.body).to match /Sign up/im
        expect(response.body).to match /Login/im
      end
    end

    describe 'GET index with current user' do
      it 'should have Edit Profile and Logout links' do
        user = User.create(email: 'email@example.com', password: 'Welcome@123', password_confirmation: 'Welcome@123')
        sign_in user
        get :index
        expect(response.body).to match /Edit profile/im
        expect(response.body).to match /Logout/im
      end
    end

  end
end
