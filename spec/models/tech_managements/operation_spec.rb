require 'rails_helper'

RSpec.describe TechManagements::Operation do

  let(:workstation) { create :workstation }
  let(:operation) { create :operation, workstation: workstation}

  describe '#workstation' do
    it { expect(operation.workstation).to eq(workstation)}
  end

end