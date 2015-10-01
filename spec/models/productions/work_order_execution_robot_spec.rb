require 'rails_helper'

RSpec.describe Productions::WorkOrderExecutionRobot, type: :model do
  let!(:execution_robot) { create :work_order_execution_robot }

  describe '#state' do

    describe '#unstart' do
     it { expect(execution_robot).to be_unstart }
    end

    describe '#agv_ready' do
      it 'agv ready' do
        # expect(execution_robot).to receive(:do_notify_robot)
        execution_robot.agv_ready
        expect(execution_robot.state).to eq('agv_ready')
      end
    end

    describe '#notifiy_robot' do

    end

  end 
end
