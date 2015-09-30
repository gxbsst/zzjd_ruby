require 'rails_helper'

RSpec.describe Products::Product, type: :model do
  describe '#name' do
    let(:product) { Products::Product.new(name: "name") }
    it { expect(product).to respond_to(:name)}
  end
end
