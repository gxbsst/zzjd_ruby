require 'rails_helper'

RSpec.describe TechManagements::Routing do

  let(:workstation) { create :workstation }
  let(:product) { create :product }
  let(:operation1) { create :operation, workstation: workstation}
  let(:operation2) { create :operation }
  let(:routing) { create :routing, operations: [operation1, operation2], product: product}

  describe '#product' do
    it { expect(routing.product).to eq(product)}
  end

  describe '#operations' do
    it { expect(routing.operations).to match_array([operation1, operation2])}
  end
end