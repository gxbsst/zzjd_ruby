FactoryGirl.define do
  factory :workcenters_workstation_task_item, :class => 'Workcenters::WorkstationTaskItem' do
    no "no"
    name "name"
    step 1
    sequence(:step) {|n| n+1}
    association :workstation_task, factory: workstation_task
  end

end
