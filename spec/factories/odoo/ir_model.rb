FactoryGirl.define do
  factory :ir_model, class: 'Odoo::IrModel' do
    sequence(:name) {|n| "name #{n}"}
    model 1
  end

end
