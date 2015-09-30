FactoryGirl.define do
  factory :company, class: 'Odoo::Company' do
    sequence(:name) {|n| "name #{n}"}

    association :currency, factory: :currency
    rml_header "header"
    association :partner, factory: :partner
    rml_paper_format "rml_paper_format"
    rml_header2 "rml_header2"
    rml_header3 "rml_header3"
    po_lead "po_lead"
  end

end
