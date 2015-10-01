require 'rails_helper'

RSpec.describe Workcenters::Workstation do
  let(:workstation) { create :workstation }
  describe '#resources' do
    # it { expect(described_class.new).to have_many(:resources) }
  end

  describe "#equipments" do
    it { expect(workstation).to respond_to(:type)}
  end
  # it { expect(described_class.new).to have_many(:equipments) }
  # it { expect(described_class.new).to have_many(:users) }

  describe '#state' do

  end
end