class Productions::Plan < ActiveRecord::Base
  self.table_name = "mj_production_plan_base"
  has_many :production_orders, class_name: 'Productions::ProductionOrder', foreign_key: :production_plan_id
  belongs_to :one_product, class_name: "Products::Product", foreign_key: :product_id
  validates :product_id, presence: true

  after_create :generate_production_order

  def generate_production_order
    self.product_number.times do |i|
      self.production_orders.create!(
          product: self.one_product,
          name: self.one_product.name,
          production_no: Time.now.to_i,
          status: "draft"
      )
    end
  end
end