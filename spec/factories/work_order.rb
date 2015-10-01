FactoryGirl.define do
  factory :work_order, :class => 'Productions::WorkOrder' do
    # sequence(:name) {|n| "equipment_#{n}"}
    association :workstation, factory: :workstation
  end
end
