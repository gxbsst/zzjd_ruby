FactoryGirl.define do
  factory :product, class: "Products::Product" do
    sequence(:name) { |n| "product_name - #{}"}
  end

end
