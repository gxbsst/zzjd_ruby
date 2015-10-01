FactoryGirl.define do
  factory :work_order_execution, :class => 'Productions::WorkOrderExecution' do
    type ""
    # state "MyString"
    association :work_order, factory: :work_order
  end

  factory :work_order_execution_robot, :class => 'Productions::WorkOrderExecutionRobot' do
    state 'unstart'
    association :work_order, factory: :work_order
  end
end
