require 'rails_helper'

RSpec.describe Workcenters::WorkstationTask do

  let(:workstation_task) { Workcenters::WorkstationTask.new }

  it { expect(workstation_task).to belong_to(:workstation)}
  it { expect(workstation_task).to have_many(:task_items)}

  # let(:workstation) { create :workstation }
  # let(:workstation_task) { create :workstation_task, workstation: workstation }
end