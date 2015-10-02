FactoryGirl.define do
  factory :routing, class: "TechManagements::Routing" do
    sequence(:name) { |n| "product_name - #{}"}
  end

end
