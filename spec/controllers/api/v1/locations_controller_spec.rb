require 'rails_helper'
describe Api::V1::LocationsController, type: :controller  do
  describe 'GET #index' do
    let!(:location) { create :location}
    before(:each) do
      get :index, format: :json
    end

    it { expect(response).to have_rendered :index }
    it { expect(assigns(:collections)).to match_array([location])}

  end
end