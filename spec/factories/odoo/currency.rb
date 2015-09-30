FactoryGirl.define do
  factory :currency, class: 'Odoo::Currency' do
    sequence(:name) {|n| "name #{n}"}
  end

end
