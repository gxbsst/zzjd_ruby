require 'rails_helper'

RSpec.describe Workcenters::Equipment, type: :model do
  let!(:equipment) { create :equipment, no: 'no', name: 'name'}

  describe '.find_by_no' do
    before(:each) do
     @equipment = Workcenters::Equipment.find_by_no('no')
    end

    it { expect(@equipment.name).to eq('name')}
    
  end
end
