require 'rails_helper'

RSpec.describe PunchesController, type: :controller do

  describe "GET #punch" do
    it "returns http success" do
      get :punch
      expect(response).to have_http_status(:success)
    end
  end

end
