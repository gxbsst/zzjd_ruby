# encoding: utf-8
class MqttDuiduoWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default
  IP = Settings.duiduoche.ip
  def perform
    client = MQTT::Client.connect(Settings.mqtt.ip)
    client.subscribe(
        'workstations/1/duiduo/2001/6496', # 物流方向--01入库--02出库--03取空货箱
        'workstations/1/duiduo/2001/6497', # 入/出库位置
        'workstations/1/duiduo/2001/6498', # 料台位置--01南料台--02北侧料台
        'workstations/1/duiduo/2001/6502', # 清理入库、出库、取空箱完成标志位
        'workstations/1/duiduo/2001/6501', # 传送链叫料---01需要上料（出库）
        'workstations/1/duiduo/2001/6502', # 入库/出库工作完成状态--01入库完成--02出库完成--03取空箱完成
        'workstations/1/duiduo/2001/6503', # 入/出库位置--入库/出库/取空箱位置
        'workstations/1/duiduo/2001/6504' # 料台位置
    )
    client.get do |topic,message|
      _, workstation_id, name, equipment_no, address = topic.split('/')

      add_1 = 6496 # 物流方向--01入库--02出库--03取空货箱
      add_2 = 6497 # 入/出库位置
      add_3 = 6498 # 料台位置--01南料台--02北侧料台
      add_4 = 6502 # 清理入库、出库、取空箱完成标志位
      add_5 = 6500 # 物流状态----00堆垛车网络掉线--01正常（空闲）--02忙--03空闲报警--04运行报警
      add_6 = 6501 # 传送链叫料---01需要上料（出库）
      add_7 = 6502 # 入库/出库工作完成状态--01入库完成--02出库完成--03取空箱完成
      add_8 = 6503 # 入/出库位置--入库/出库/取空箱位置
      add_8 = 6504 # 料台位置
      # 收到完成信号，清理出入库标志位
      if add_7 == address.to_i && message.to_i == 1
        Modbus.write(IP, add_1, 0)
      end
    end
    # $mqtt_duiduo.get do |topic,message|
    #   _, workstation_id, name, equipment_no, address = topic.split('/')
    #
    #   add_1 = 6496 # 物流方向--01入库--02出库--03取空货箱
    #   add_2 = 6497 # 入/出库位置
    #   add_3 = 6498 # 料台位置--01南料台--02北侧料台
    #   add_4 = 6502 # 清理入库、出库、取空箱完成标志位
    #   add_5 = 6500 # 物流状态----00堆垛车网络掉线--01正常（空闲）--02忙--03空闲报警--04运行报警
    #   add_6 = 6501 # 传送链叫料---01需要上料（出库）
    #   add_7 = 6502 # 入库/出库工作完成状态--01入库完成--02出库完成--03取空箱完成
    #   add_8 = 6503 # 入/出库位置--入库/出库/取空箱位置
    #   add_8 = 6504 # 料台位置
    #
    #   binding.pry
    #
    #   # 收到完成信号，清理出入库标志位
    #   if add_7 == address && message == 1
    #     binding.pry
    #    Modbus.write(IP, add_4, 0)
    #   end
    #
    #   # equipment = Workcenters::Equipment.find_by(no: equipment_no)
    #   # if equipment
    #   #   Workcenters::EquipmentDaq.find_or_create_by(equipment: equipment) do |daq|
    #   #     daq.address = address
    #   #     daq.value = message
    #   #     daq.name = name
    #   #     daq.save
    #   #   end
    #   # end
    # end
  end
end