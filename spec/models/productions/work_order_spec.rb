require 'rails_helper'

RSpec.describe Productions::WorkOrder do

  it { expect(described_class.new).to belong_to(:workstation) }
  it { expect(described_class.new).to respond_to(:work_station) }
  # it { expect(described_class.new).to have_many(:equipments) }
  # it { expect(described_class.new).to have_many(:users) }
end