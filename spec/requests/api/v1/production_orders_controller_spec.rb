# encoding: utf-8
require 'rails_helper'
describe Api::V1::ProductionOrdersController do
  let(:workstation) { create :workstation, no: 1003 }
  let(:workstation1) { create :workstation, no: 1004 }
  let(:operation1) { create :operation, sequence: 1, name: 'operation 1', workstation: workstation }
  let(:operation2) { create :operation, sequence: 2, name: 'operation 2', workstation: workstation1 }
  let(:routing) { create :routing, operations: [operation1, operation2]}
  let(:product) { create :product, routing: routing}

  describe 'GET #index' do
    let!(:production_order) { create :production_order, name: '某某的生产订单', product: product, status: 'draft'}
    before(:each) do
      get "/v1/production_orders", {}
      @json = parse_json(response.body)
    end
    it { expect(response.body).to have_json_type(Hash)}
    it { expect(@json['data'].size).to eq(1)}
    it { expect(@json['data'][0]['work_orders'].size).to eq(2)}
    it { expect(@json['data'][0]['work_orders'][0].status).to eq(2)}
    # it { expect(@json['data'][0]['product']['id']).to eq(product.id)}
    it { expect(@json['meta']).to eq(nil)}
    it { expect(@json['data'][0]['name']).to eq('某某的生产订单')}
  end

  describe 'start' do
    context 'order have  not finished' do
      let!(:production_order) { create :production_order, name: '某某的生产订单', product: product, status: 'draft'}
      before(:each) do
        patch "/v1/production_orders/#{production_order.id}/actions/start", {}
        @json = parse_json(response.body)
      end

      it { expect(response.status).to eq(200)}
      it { expect(Productions::ProductionOrder.first.status).to eq('processing')}
      it { expect(Productions::ProductionOrder.first.orders.first.status).to eq('processing')}
    end

    context 'order have finished' do
      let!(:production_order) { create :production_order, name: '某某的生产订单', product: product, status: 'finished'}
      before(:each) do
        patch "/v1/production_orders/#{production_order.id}/actions/start", {}
        @json = parse_json(response.body)
      end

      it { expect(response.status).to eq(422)}
    end

  end
end