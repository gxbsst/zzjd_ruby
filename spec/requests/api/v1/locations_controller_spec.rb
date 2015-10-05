require 'rails_helper'
describe Api::V1::LocationsController  do
  describe 'GET #index' do
    let!(:location) { create :location, area: 'area_a' }
    let!(:location1) { create :location, area: 'area_b' }
    before(:each) do
      get "/v1/locations", {}
      @json = parse_json(response.body)
    end
    it { expect(response.body).to have_json_type(Hash)}
    it { expect(@json['data']["area_a"].count).to eq(1)}
    it { expect(@json['data']["area_b"].count).to eq(1)}
  end

  describe 'PATCH bind_barcode' do
    let!(:product) { create :product }
    let!(:transport_unit) { create :transport_unit, barcode: 1}
    let!(:location) { create :location, area: 'area_a' }
    before(:each) do
      patch "/v1/locations/actions/bind_barcode", {barcode: transport_unit.barcode, product_id: product.id}
      @json = parse_json(response.body)
    end
    it { expect(response.status).to eq(200)}
  end
end