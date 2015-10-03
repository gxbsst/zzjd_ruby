require 'rails_helper'

RSpec.describe Productions::Plan do
  describe 'generate production order' do

    let(:workstation) { create :workstation, no: 1003 }
    let(:workstation1) { create :workstation, no: 1004 }
    let(:operation1) { create :operation, sequence: 1, name: 'operation 1', workstation: workstation }
    let(:operation2) { create :operation, sequence: 2, name: 'operation 2', workstation: workstation1 }
    let(:routing) { create :routing, operations: [operation1, operation2]}
    let(:product) { create :product, routing: routing, product_no: 30001}

    before(:each) do
      # @plan = create :production_plan, product_number: 1, product_id: product.id
    end

    it "generate a production order" do
      @plan = Productions::Plan.create!  product_number: 1, one_product: product, status: 'draft'
      expect(@plan.product_id).to eq(1)
      @plan.generate_production_order
      expect(Productions::ProductionOrder.count).to be(1)
      expect(Productions::WorkOrder.count).to be(2)
    end

  end
end