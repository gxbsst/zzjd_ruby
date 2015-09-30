FactoryGirl.define do
  factory :mail_alias, class: 'Odoo::MailAlias' do
    # sequence(:name) {|n| "name #{n}"}
    alias_defaults "alias_defaults"
    alias_contact "alias_contact"

    association :ir_model, factory: :ir_model
  end

end
