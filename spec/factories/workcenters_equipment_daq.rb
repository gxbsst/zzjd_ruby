FactoryGirl.define do
  factory :equipment_daq, :class => 'Workcenters::EquipmentDaq' do
    address "address"
    value "value"
    association :equipment, factory: :equipment
  end

end
