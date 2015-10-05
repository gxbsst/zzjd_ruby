require 'rails_helper'
describe Api::V1::ProductionOrdersController, type: :controller  do
  describe 'GET #index' do
    let(:workstation) { create :workstation, no: 1003 }
    let(:workstation1) { create :workstation, no: 1004 }
    let(:operation1) { create :operation, sequence: 1, name: 'operation 1', workstation: workstation }
    let(:operation2) { create :operation, sequence: 2, name: 'operation 2', workstation: workstation1 }
    let(:routing) { create :routing, operations: [operation1, operation2]}
    let(:product) { create :product, routing: routing}
    let!(:production_order) { create :production_order, product: product, status: 'draft'}
    before(:each) do
      get :index, format: :json
    end

    it { expect(response).to have_rendered :index }
    it { expect(assigns(:collections)).to match_array([production_order])}

  end
end