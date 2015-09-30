FactoryGirl.define do
  factory :workstation_resource, :class => 'Workcenters::Resource' do
    sequence(:name) {|n| "equipment_#{n}"}
  end
end
