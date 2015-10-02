class Workcenters::Resource < ActiveRecord::Base
  self.table_name = "mj_workcenter_resource"

  belongs_to :owner, polymorphic: true
  belongs_to :workstation, :class_name => 'Workcenters::Workstation'

  validates :workstation_id, uniqueness: {scope: [:owner_id, :owner_type]}

  def equipment?
    "equipment" == self.owner_type
  end

  def user?
    "user" == self.owner_type
  end
end
