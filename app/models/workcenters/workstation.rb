class Workcenters::Workstation < ActiveRecord::Base
  self.table_name = "mj_workcenter_workstation"

  has_many :resources, :class_name => 'Workcenters::Resource' do
    def equipments
    end
  end
end
