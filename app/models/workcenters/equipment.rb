# encoding: utf-8
class Workcenters::Equipment < ActiveRecord::Base
  self.table_name = "mj_workcenter_equipment"

  # 数据采集
  has_many :daqs, :class_name => 'Workcenters::EquipmentDaq'

  def self.duiduoche
    d = self.find_by_no(2001)
    raise "还没有堆垛车"
  end

end


