FactoryGirl.define do
  factory :location_type, class: 'Wms::LocationType' do
    sequence(:type) {|n| "#{n}_type"}
  end
end
