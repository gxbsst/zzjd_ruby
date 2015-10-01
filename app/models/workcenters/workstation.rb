# encoding: utf-8
class Workcenters::Workstation < ActiveRecord::Base
  self.table_name = "mj_workcenter_workstation"

  has_many :resources, :class_name => 'Workcenters::Resource' do
    def equipments
    end
  end

  def notify_plc_with_agv_ready
    raise "该方法必须在子类调用"
  end

  alias_method :notify_robot, :notify_plc_with_agv_ready
end
