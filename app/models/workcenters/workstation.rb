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

  # AGV 到站
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
      send_xml_at_wms(tcs_order_line)

    elsif self.type == 'Workcenters::WorkstationAssembly' # 通知装配的机器人
      workstation_no = destination_name.destination_name
      workstation_no_to_registers = {
          "1010"  => 4097,
          "1011" => 4098,
          "1012" => 4099 ,
          "1013" => 4100,
          "1014" =>  4101,
          "1015"  => 4102
      }

      ip = Settings.robot_plc.ip
      workstation_add = workstation_no_to_registers[workstation_no]
      command_add = 4096
      value = 1
      ModBus::TCPClient.new(ip, 502) do |cl|
        cl.with_slave(2) do |slave|
          slave.holding_registers[workstation_add] = values
          slave.holding_registers[command_add] = values
        end
      end


      # TODO: 找到这个工位对应的设备, 这里是机器人PLC
    elsif self.type == 'Workcenters::Test' # 通知装配的机器人
      # TODO: 找到这个工位对应的设备, 这里是机器人PLC
    end
  end

  def send_xml_at_wms(tcs_order_line)
    production_order = tcs_order_line.one_tcs_order.production_order
    production_order.send_xml_at_wms
  end

  alias_method :notify_robot, :notify_plc_with_agv_ready
end
