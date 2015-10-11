# encoding: utf-8
class MqttRobotWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default

  IP = Settings.robot_plc.ip

  ADDRESS_MAP_WORKSTATION_NO = {
      "1010"  => 4097,
      "1011" => 4098,
      "1012" => 4099 ,
      "1013" => 4100,
      "1014" =>  4101,
      "1015"  => 4102
  }
  def perform
    robot_plc = ModbusRobot.build
    client = MQTT::Client.connect(Settings.mqtt.ip)
    client.subscribe(
        'robot/1010/4097',
        'robot/1011/4098',
        'robot/1012/4099',
        'robot/1013/4100',
        'robot/1014/4101',
        'robot/1015/4102',
        'robot/1010/plc/4103' # 1 完成 2 进行中 3 Error 4 准备完成
    )
    client.get do |topic,message|
      _, workstation_id, address = topic.split('/')

      # order_line = Tcs::OrderLine.find_by(location_name: workstation_id, destination_name: workstation_id)
      # workstation_add = workstation_no_to_registers[workstation_no]

      value = message[/\d+/].to_i
      if topic == 'robot/1010/plc/4103' && value == 1
        # 当前在产线旁边的小车
        order_lines = Tcs::OrderLine.where(location_name: ADDRESS_MAP_WORKSTATION_NO.keys)
        order_lines.each do |line|
          line.send_next_xml
        end
      end

      # 如果是进行的时候，更新寄存器全部为0
      if topic == 'robot/1010/plc/4103' && value == 2
        robot_plc.clear('all')
        # ModBus::TCPClient.new(ip, 502) do |cl|
        #   cl.with_slave(2) do |slave|
        #     slave.holding_registers[4096..4102] = 0
        #   end
        # end
      end

      # TODO:
      # 1. 如果收到已经取好活
      # 2. AGV 走到下一个工位

    end
  end
end