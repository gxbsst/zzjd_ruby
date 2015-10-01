FactoryGirl.define do
  factory :workstation_task, :class => 'Workcenters::WorkstationTask' do
    sequence(:name) {|n| "task_name_#{n}"}
    association :workstation, factory: workstation
  end
end
