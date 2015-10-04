require 'rails_helper'
RSpec.describe Equipments::Nc::Nc1 do

  describe '#action' do
    context "in" do
      let(:nc1) { Equipments::Nc::Nc1.new(action: 'in') }
      it { expect(nc1.action).to eq('in')}
      it { expect(nc1).to  be_in}
    end
    context "out" do
      let(:nc1) { Equipments::Nc::Nc1.new(action: 'out') }
      it { expect(nc1.action).to eq('out')}
      it { expect(nc1).to be_out }
    end
  end
  describe 'state' do
    describe '#busy?' do
      let(:nc1) { Equipments::Nc::Nc1.new(state_1: 0, state_2: 0) }
      it { expect(nc1).to be_busy }
    end

    describe '#can_start?' do
      context "when valid code is not valid" do
        let(:nc1) { Equipments::Nc::Nc1.new(state_1: 1, state_2: 0, valid_code: 1) }
        it { expect(nc1).to_not  be_can_start }
      end

      context "when valid code is valid" do
        let(:nc1) { Equipments::Nc::Nc1.new(state_1: 1, state_2: 0, valid_code: 0) }
        it { expect(nc1).to be_can_start }
      end
    end

    describe '#jig_can_close?' do
      let(:nc1) { Equipments::Nc::Nc1.new(state_1: 1, state_2: 1) }
      it { expect(nc1).to  be_jig_can_close }
    end

    describe '#jig_can_open?' do
      let(:nc1) { Equipments::Nc::Nc1.new(state_1: 0, state_2: 1) }
      it { expect(nc1).to  be_jig_can_open }
    end
  end

  describe Equipments::Nc::Button do
    let(:nc1) { Equipments::Nc::Nc1.new(state_1: 1, state_2: 0, valid_code: 1) }
    let(:button) { Equipments::Nc::Button.new }

    it "do running" do
      button.do_start nc1
      expect(button.start_state).to eq(0)
    end

    it "do cancel" do
      button.do_cancel nc1
      expect(button.cancel_state).to eq(1)
    end
  end

end
