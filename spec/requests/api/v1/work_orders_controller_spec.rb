# encoding: utf-8
require 'rails_helper'
describe Api::V1::WorkOrdersController do
  let(:workstation) { create :workstation, no: 1003 }
  let(:workstation1) { create :workstation, no: 1004 }
  let(:operation1) { create :operation, sequence: 1, name: 'operation 1', workstation: workstation }
  let(:operation2) { create :operation, sequence: 2, name: 'operation 2', workstation: workstation1 }
  let(:routing) { create :routing, operations: [operation1, operation2]}
  let(:product) { create :product, routing: routing}
  let!(:production_order) { create :production_order, name: '某某的生产订单', product: product, status: 'draft'}

  describe 'start' do
    context 'order have  not finished' do
      before(:each) do
        patch "/v1/work_orders/#{production_order.orders.first.id}/actions/start", {}
        @json = parse_json(response.body)
      end

      it { expect(response.status).to eq(200)}
      it { expect(Productions::WorkOrder.first.status).to eq('processing')}
    end

    context 'order have finished' do
      before(:each) do
        work_order = production_order.orders.last
        work_order.start
        patch "/v1/work_orders/#{work_order.id}/actions/start", {}
        @json = parse_json(response.body)
      end

      it { expect(response.status).to eq(422)}
    end

  end
end