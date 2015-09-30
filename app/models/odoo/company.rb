class Odoo::Company < ActiveRecord::Base
  self.table_name = "res_company"

  belongs_to :partner, class_name: "Odoo::Partner", foreign_key: :partner_id
  belongs_to :currency, class_name: "Odoo::Currency", foreign_key: :currency_id
end