FactoryGirl.define do
  factory :partner, class: 'Odoo::Partner' do
    sequence(:name) {|n| "name #{n}"}
    sequence(:notify_email) {|n| "w_#{n}@qq.com"}
  end

end
