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

  # TODO: 这段逻辑会比较复杂，因为需要判断设备的状况
  def start_working(tcs_order_line)
    if self.type == 'Workcenters::WorkstationWms' #堆垛车干活
      # TODO: 找到这个工位对应的设备, 这里是堆垛车
      # 是出库还是入库
      chain = tcs_order_line.one_tcs_order.production_order.logistics_chains.where.not( status: 'finished').first
      if chain.owner.in_stock? #  
        chain.owner.in_stock
        # 让堆垛车工作
      else
        chain.owner.in_stock
      end

    elsif self.type == 'Workcenters::Nc' # 通知机器人、NC设备
      # TODO: 找到这个工位对应的设备, 这里是机器人PLC, NC设备
      # send xml to device manage system
      send_xml(tcs_order_line)

    elsif self.type == 'Workcenters::WorkstationAssembly' # 通知装配的机器人
      # TODO: 找到这个工位对应的设备, 这里是机器人PLC
    elsif self.type == 'Workcenters::Test' # 通知装配的机器人
      # TODO: 找到这个工位对应的设备, 这里是机器人PLC
    end
  end

  def send_xml(tcs_order_line)
    production_order = tcs_order_line.one_tcs_order.production_order
    production_order.send_xml
  end

  alias_method :notify_robot, :notify_plc_with_agv_ready
end
