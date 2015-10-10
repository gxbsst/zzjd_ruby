# encoding: utf-8
class MqttRobotWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default

  IP = Settings.robot_plc.ip

  ADDRESS_MAP_WORKSTATION_NO = {
      "6496" => "1011",
      "6497" => "1012",
      "6498" => "1013",
      "6499" => "1014",
      "6500" => "1015"
  }
  def perform
    client = MQTT::Client.connect(Settings.mqtt.ip)
    client.subscribe(
        'robot/1010/6496',
        'robot/1011/6497',
        'robot/1012/6498',
        'robot/1013/6499',
        'robot/1014/6500'
    )
    client.get do |topic,message|
      _, workstation_id, address = topic.split('/')

      order_line = Tcs::OrderLine.find_by(location_name: workstation_id, destination_name: workstation_id)

      order_line.send_next_xml# 实现这个方法

      # TODO:
      # 1. 如果收到已经取好活
      # 2. AGV 走到下一个工位

    end
  end
end