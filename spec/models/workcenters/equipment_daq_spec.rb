require 'rails_helper'

RSpec.describe Workcenters::EquipmentDaq, type: :model do
  let(:equipment) { create :equipment}
  let(:equipment_state) { create :equipment_daq, equipment: equipment, address: '00001', value: '111'}

  it { expect(equipment_state.equipment).to eq(equipment)}
  it { expect(equipment_state.address).to eq('00001')}
  it { expect(equipment_state.value).to eq('111')}



end
