FactoryGirl.define do
  factory :location, class: 'Wms::Location' do
    no 1
    sequence(:x)  { |n| n }
    y 1
    z 1
    plc_state 1
    area "area"
    outgoing_active true
    counting_active true
    aisle 1
    association :location_type
  end
end
