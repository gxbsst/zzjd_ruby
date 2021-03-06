require 'rails_helper'

RSpec.describe Productions::ProductionOrder do

  describe 'valid' do
    let(:product_order) { Productions::ProductionOrder.new }

    it 'valid new record' do
      product_order.valid?
      # expect(product_order.errors[:status].size).to eq(1)
    end
    it { expect(production_order).to have_many(:logistics_chains)}
  end

  let!(:workstation) { create :workstation, no: 1003 }
  let!(:workstation1) { create :workstation, no: 1004 }
  let!(:operation1) { create :operation, sequence: 1, name: 'operation 1', workstation: workstation }
  let!(:operation2) { create :operation, sequence: 2, name: 'operation 2', workstation: workstation1 }
  let!(:routing) { create :routing, operations: [operation1, operation2]}
  let!(:product_for_bom_line) { create :product}
  let!(:bom_line1) { create :bom_line, product: product_for_bom_line }
  let!(:bom_line2) { create :bom_line }
  let!(:bom) { create :bom, bom_lines: [bom_line1, bom_line2] }
  let!(:product) { create :product, routing: routing, bom: bom}
  let!(:production_order) { create :production_order, product: product, status: :'draft'}

  describe 'model relation' do
    let(:po) { Productions::ProductionOrder.new }

    it { expect(po).to have_one(:tcs_order)}
    it { expect(po).to have_many(:tcs_order_lines)}

    describe 'tcs_order' do

      let(:po) { create :production_order }
      it { expect(po.tcs_order.order_name).to_not be_nil}
    end

  end

  describe 'generates' do
    describe 'generate work orders' do
      before(:each) do
        production_order.generate_work_orders
      end

      it "have order" do
        expect(production_order.orders.count).to be(2)
      end

      it "work order sequence" do
        expect(production_order.orders.first.sequence).to eq(1)
        expect(production_order.orders.last.sequence).to eq(2)

        expect(production_order.orders.first.operation_name).to eq('operation 1')
        expect(production_order.orders.last.operation_name).to eq('operation 2')
      end
    end

    describe '#generate_agv_transport' do
      before(:each) do
        production_order.generate_tcs_order_lines
      end

      it "have transport order" do
        expect(Tcs::OrderLine.all.count).to be(4)
      end
    end

    describe '#generate_wms_transport' do
      before(:each) do
        production_order.generate_wms_transport_order
      end

      it "have transport order" do
        expect(Wms::TransportOrder.count).to be(2)
      end
    end

    describe '#generate_logistics_chains' do
      before(:each) do
        production_order.generate_logistics_chains
      end

      it "have many logistics_chains" do
        expect(production_order.logistics_chains.count).to be(6)
      end

    end
  end

  describe "#action_start" do
    before(:each) do
      production_order.action_start
    end
    it { expect(production_order.status).to eq('processing')}
  end
end