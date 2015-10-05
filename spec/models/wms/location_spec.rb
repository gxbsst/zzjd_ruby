require 'rails_helper'

RSpec.describe Wms::Location, type: :model do

  describe 'scope' do
    context '.area_a' do
      let!(:location) { create :location, area: 'area_a'}
      it { expect(Wms::Location.area_a.first.area).to eq('area_a')}
    end
    context '.area_b' do
      let!(:location) { create :location, area: 'area_b'}
      it { expect(Wms::Location.area_b.first.area).to eq('area_b')}
    end
  end
end
