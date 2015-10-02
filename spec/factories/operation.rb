FactoryGirl.define do
  factory :operation, class: "TechManagements::Operation" do
    sequence(:name) { |n| "product_name - #{}"}
  end

end
