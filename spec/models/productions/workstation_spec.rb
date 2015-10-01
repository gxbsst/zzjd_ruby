require 'rails_helper'

RSpec.describe "Productions::Workstation" do

  # it { expect(described_class.new).to respond_to(:wo) }
  # it { expect(described_class.new).to have_many(:equipments) }
  # it { expect(described_class.new).to have_many(:users) }

  let(:workstation) { create :workstation}

  describe '#notify_robot' do
    it { expect(workstation).to respond_to(:notify_robot)}
  end
end