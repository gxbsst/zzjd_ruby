class OdooUser < ActiveRecord::Base
  self.table_name = "res_users"

  belongs_to :mail_alias, class_name: "Odoo::MailAlias", foreign_key: :alias_id
  belongs_to :company, class_name: "Odoo::Company", foreign_key: :company_id
  belongs_to :partner, class_name: "Odoo::Partner", foreign_key: :partner_id

  validates :login, :company_id,  presence: true
end