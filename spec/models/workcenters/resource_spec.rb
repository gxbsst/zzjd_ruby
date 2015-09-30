require 'rails_helper'

RSpec.describe Workcenters::Resource do
  describe 'is equipment' do
    let(:equipment) { create :equipment }
    let(:resource) { create :workstation_resource, owner_type: 'equipment', owner_id: equipment.id }

    it { expect(resource.owner_type).to eq('equipment')}
    it { expect(resource).to be_equipment }
  end

  describe 'is human' do
    let(:user) { create :odoo_user}
    let(:resource) { create :workstation_resource, owner_type: 'user', owner_id: user.id }

    it { expect(resource.owner_type).to eq('user')}
    it { expect(resource).to be_user }
  end
end