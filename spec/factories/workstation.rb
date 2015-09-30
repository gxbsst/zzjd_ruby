FactoryGirl.define do
  factory :workstation, :class => 'Workcenters::Workstation' do
    sequence(:name) {|n| "workstaiton_#{n}"}
  end
end
