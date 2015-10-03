FactoryGirl.define do
  factory :production_plan, class: "Productions::Plan" do
    # association :product, fatory: product
    product_number 1
    status 'draft'
  end

end
