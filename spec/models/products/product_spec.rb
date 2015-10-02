require 'rails_helper'

RSpec.describe Products::Product do

  let(:operation1) { create :operation }
  let(:operation2) { create :operation }
  let(:routing) { create :routing, operations: [operation1, operation2]}
  let(:product) { create :product,  routing: routing}

  describe '#routing' do
    it { expect(product.routing.product_id).to eq(1)}
  end
end