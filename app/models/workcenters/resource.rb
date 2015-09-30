class Workcenters::Resource < ActiveRecord::Base
  self.table_name = "mj_workcenter_resource"

  def equipment?
    "equipment" == self.owner_type
  end

  def user?
    "user" == self.owner_type
  end
end
