FactoryGirl.define do
  factory :odoo_user, class: 'OdooUser' do
    sequence(:login) {|n| "login_#{n}"}
    partner_id 1

    association :mail_alias, factory: :mail_alias
    association :partner, factory: :partner
    association :company, factory: :company
  end

end
