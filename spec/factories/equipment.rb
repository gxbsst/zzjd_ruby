FactoryGirl.define do
  factory :equipment, :class => 'Workcenters::Equipment' do
    sequence(:name) {|n| "equipment_#{n}"}
  end
end
