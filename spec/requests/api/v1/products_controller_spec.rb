require 'rails_helper'
describe Api::V1::ProductsController  do
  describe 'GET #index' do
    let!(:product) { create :product, name: 'name' }
    before(:each) do
      get "/v1/products", {}
      @json = parse_json(response.body)
    end
    it { expect(response.body).to have_json_type(Hash)}
    it { expect(@json['data'].count).to eq(1)}
    it { expect(@json['data'][0]['name']).to eq("name")}
  end
end